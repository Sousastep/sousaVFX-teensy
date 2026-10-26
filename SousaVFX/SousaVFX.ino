#include <OctoWS2811.h>
#include <algorithm>
#include <vector>
#define USE_OCTOWS2811
#include <FastLED.h>
// FASTLED_USING_NAMESPACE was removed in FastLED 3.10.x: the public API
// (CRGB, CHSV, FastLED, ColorFromPalette, ...) is now exported into the
// global namespace directly by the library.
#define LED_TYPE WS2812B
#define COLOR_ORDER GRB
#define BRIGHTNESS 0
#include "coordinate_maps.h"
#include "palettes.h"
#define MAX_POWER_MW 40000
#define FRAMES_PER_SECOND 260
#define ARRAY_SIZE(A) (sizeof(A) / sizeof((A)[0]))

const uint16_t frameInterval = 1000000 / FRAMES_PER_SECOND;
const int config = WS2811_GRB | WS2811_800kHz;  // why's this differ from #define LED_TYPE ?
const int ledsPerStrip = 26;
const int numStrips = 8;
const int numChannels = ledsPerStrip * numStrips * 3;
DMAMEM int displayMemory[ledsPerStrip * 6];
int drawingMemory[ledsPerStrip * 6];
boolean newData = false;
unsigned long previousMicros = 0;
uint8_t gradientOffsetInt = 0;

//
// all params range from 0 to 253 due to using 254 and 255 as start and end markers
// for incoming serial data via recvWithStartEndMarkers()
// https://gist.github.com/embaster/642fed1680bd521baf674614583faaad
//
struct VFXParams {
  uint8_t brightness = 80;
  uint8_t radiusCutoff = 253;
  uint8_t currentPaletteIndex = 0;
  uint8_t divisionHi = 3;
  uint8_t divisionLo = 0;
  uint8_t divisionWidth = 126;
  uint8_t divisionCurve = 126;
  uint8_t rotation = 0;
  uint8_t fadeIn = 253;
  uint8_t fadeOut = 253;
  uint8_t peakPos = 126;
  uint8_t pattern = 0;
  uint8_t gradientOffset = 0;
  uint8_t maskType = 0;
} params;

const uint8_t sizeofparams = sizeof(VFXParams);
uint8_t receivedChars[sizeofparams];
uint8_t angleOffsets[NUM_LEDS];
OctoWS2811 octo(ledsPerStrip, displayMemory, drawingMemory, config);

float clampFloat(float x, float lowerlimit = 0.0f, float upperlimit = 1.0f) {
  if (x < lowerlimit) return lowerlimit;
  if (x > upperlimit) return upperlimit;
  return x;
}

// FastLED 3.10.x doesn't re-export lerp8by8() into the global namespace, so
// provide the same 8-bit lerp locally (scale8 *is* still exported).
uint8_t lerp8(uint8_t a, uint8_t b, uint8_t frac) {
  if (b > a) return a + scale8(b - a, frac);
  return a - scale8(a - b, frac);
}

// Hot-path variant for the per-LED render loop: smoothstep on a pre-normalized
// t in 0..1 (clamped internally). Callers pre-scale t with reciprocal multiplies
// so the loop avoids float division, which is slow on ARM.
//
// 7th-order smoothstep https://en.wikipedia.org/wiki/Smoothstep#7th-order_equation
//   S3(x) = -20x^7 + 70x^6 - 84x^5 + 35x^4
// with zero first, second, and third derivatives at both endpoints. Since all
// hot paths go through the LUT, this only runs at boot (LUT build) and once per
// frame (palette blend), so the higher order costs nothing at runtime.
float smootherstep01(float t) {
  t = clampFloat(t);

  float t2 = t * t;
  float t4 = t2 * t2;
  // -20t^7 + 70t^6 - 84t^5 + 35t^4 = t^4 * (35 - 84t + 70t^2 - 20t^3)
  float inner = 35.0f - t * (84.0f - t * (70.0f - 20.0f * t));
  return t4 * inner;
}

float smootherstep(float edge0, float edge1, float x) {
  // Scale, and clamp x to 0..1 range
  return smootherstep01((x - edge0) / (edge1 - edge0));
}

// Lookup table of smootherstep01 scaled to 0..255. The per-LED render loop
// (Teensy 3.2 has no FPU — float math is software-emulated) does the easing
// with one byte lookup + integer lerp instead of a float polynomial.
uint8_t smootherstepLUT[256];

void buildSmootherstepLUT() {
  for (int i = 0; i < 256; i++) {
    float t = i / 255.0f;
    smootherstepLUT[i] = static_cast<uint8_t>(255.0f * smootherstep01(t) + 0.5f);
  }
}

void setup() {
  Serial.begin(115200);
  buildSmootherstepLUT();
  buildCoordinateMaps();
  FastLED.setBrightness(BRIGHTNESS);
  octo.begin();
  test();
}

// List of patterns to cycle through.  Each is defined as a separate function below.
typedef void (*SimplePatternList[])();
SimplePatternList patterns = {
    // 2D map examples:
    divisionPalette, outwardPalette, inwardPalette, clockwisePalette, counterClockwisePalette, northPalette,
    northEastPalette, eastPalette, southEastPalette, southPalette, southWestPalette, westPalette, northWestPalette,
    // standard FastLED demo reel examples:
    rainbow, rainbowWithGlitter, confetti, sinelon, juggle, bpm};

constexpr float paramNorm = 1.0f / 253.0f;
const uint8_t paletteCount = ARRAY_SIZE(palettes);
const uint8_t patternCount = ARRAY_SIZE(patterns);
uint8_t currentPatternIndex = 0;
uint8_t previousPalette = 0;
CRGBPalette16 currentPalette = palettes[params.currentPaletteIndex];
CRGBPalette16 targetPalette = currentPalette;

// Palette crossfade state — eased with smootherstep over paletteBlendSeconds.
unsigned long paletteBlendStartMicros = 0;
float paletteBlendProgress = 0.0f;  // last frame's smoothed progress (0..1)
constexpr float paletteBlendSeconds = 1.0f;

void loop() {
  recvWithStartEndMarkers();
  unsigned long currentMicros = micros();
  if ((newData) && (currentMicros - previousMicros >= frameInterval)) {
    newData = false;
    previousMicros = currentMicros;
    memcpy(&params, receivedChars, sizeofparams);
    if (previousPalette != params.currentPaletteIndex) {
      targetPalette = palettes[params.currentPaletteIndex];
      previousPalette = params.currentPaletteIndex;
      paletteBlendStartMicros = currentMicros;
      paletteBlendProgress = 0.0f;
    }

    float gradientOffsetNorm = params.gradientOffset * paramNorm;
    gradientOffsetInt = static_cast<int8_t>(gradientOffsetNorm * 255.0f);

    // Blend currentPalette toward targetPalette, eased with smootherstep:
    // each frame moves a fraction of the remaining distance chosen so overall
    // progress follows a smootherstep curve (slow start, fast middle, slow end).
    // nblendPaletteTowardPalette moves maxChange/255 of the *remaining* distance,
    // so the per-frame amount is 255 * deltaProgress / (1 - previousProgress).
    float paletteBlendT = (currentMicros - paletteBlendStartMicros) / (paletteBlendSeconds * 1000000.0f);
    float easedProgress = smootherstep01(paletteBlendT);
    float amountF;
    if (easedProgress >= 1.0f) {
      amountF = (paletteBlendProgress < 1.0f) ? 255.0f : 0.0f;  // snap any leftover on the final frame
    } else {
      amountF = 255.0f * (easedProgress - paletteBlendProgress) / (1.0f - paletteBlendProgress);
    }
    paletteBlendProgress = easedProgress;
    uint8_t blendAmount = (amountF >= 255.0f) ? 255 : static_cast<uint8_t>(amountF);
    nblendPaletteTowardPalette(currentPalette, targetPalette, blendAmount);
    patterns[params.pattern]();

    // Moire patterns emerge with high numbers of divisions
    // inspired by: mojovideotech's pinwheel shader https://editor.isf.video/shaders/5e7a7fe07c113618206de624
    //              & Jason Coon's work https://github.com/jasoncoon/
    // divisionLo represents the fractional part of the overall number of pinwheel divisions.
    // It's divided by 254 instead of 253 because divisionLo never needs to reach 1.
    // ( all params range from 0 to 253 due to recvWithStartEndMarkers )
    float divisionLo = (params.divisionLo / 254.0f);
    float pinwheelDivisions = params.divisionHi + divisionLo;
    float pinwheelDivisionsInv = 1.0f / pinwheelDivisions;
    float angleSize = 360.0f * pinwheelDivisionsInv;

    // Instead of doing a full 360 deg rot with params.rotation, it's multiplied by angleSize
    // so it only moves one "division length", which causes a full rotation of the moire pattern.
    float angleRotationAmt = (angleSize * (params.rotation * paramNorm));

    // The following helps fade each division in and out.
    float fadeInNorm = params.fadeIn * paramNorm;
    float fadeOutNorm = params.fadeOut * paramNorm;
    float divisionWidthNorm = params.divisionWidth * paramNorm;
    float peakPosNorm = params.peakPos * paramNorm * divisionWidthNorm;

    // Fade edge of radius cutoff.
    constexpr float radiusFadeLength = 0.08f;  // could be a param
    float radiusCutoff = params.radiusCutoff * paramNorm * 255.0f;

    float brightnessNorm = params.brightness * paramNorm;
    uint8_t brightness8 = (brightnessNorm >= 1.0f) ? 255 : static_cast<uint8_t>(brightnessNorm * 256.0f);

    // Divide curve amount by number of divisions to keep it sane.
    float divisionCurve = (((params.divisionCurve * paramNorm) * 6.0f) - 3.0f) * pinwheelDivisionsInv;

    constexpr float oneDeg = 1.0f / 360.0f;
    constexpr float oneIndex = 1.0f / 200.0f;
    float phaseMultAngle = oneDeg * pinwheelDivisions;
    float phaseMultIndex = oneIndex * pinwheelDivisions;
    // float phaseMultCoord = (1.0f / 800.0f) * pinwheelDivisions;
    uint16_t divisionWidthFixed = divisionWidthNorm * 65535.0f;
    uint16_t peakPosFixed = peakPosNorm * 65535.0f;
    float rotationNormalized = angleRotationAmt * phaseMultAngle;  // what happens if these are replaced with phaseMultIndex?
    float curveNormalized = divisionCurve * phaseMultAngle;

    float radiusCutoffEnd = radiusCutoff + (radiusFadeLength * 255.0f);
    bool isFirstPattern = (params.pattern == 0);

    // Pre-scale constants once per frame so the per-LED loop is just one float
    // multiply (position -> LUT index) followed by pure integer easing math.
    // The *255 factors fold the 0..255 LUT scale into the reciprocal.
    float radiusFadeInv255 = 255.0f / (radiusCutoffEnd - radiusCutoff);
    uint8_t fadeIn8 = static_cast<uint8_t>(fadeInNorm * 255.0f + 0.5f);
    uint8_t fadeOut8 = static_cast<uint8_t>(fadeOutNorm * 255.0f + 0.5f);
    float invPeakPos255 = (peakPosFixed > 0) ? (255.0f / static_cast<float>(peakPosFixed)) : 0.0f;
    float invFadeSpan255 = (divisionWidthFixed > peakPosFixed)
                               ? (255.0f / (static_cast<float>(divisionWidthFixed) - static_cast<float>(peakPosFixed)))
                               : 0.0f;

    for (int i = 0; i < NUM_LEDS; i++) {
      float totalPhase = 0;
      float radHiRez = radiihirez[swapindex[i]];

      /*
      // case 0 is how I originally developed this effect, which has a seam.
      // case 1 is inspired by Jason Coon, and doesn't have a seam:
      // https://bsky.app/profile/evilgeniuslabs.org/post/3lufmcvpolk2k
      // case 2 is experimental.
      */
      switch (params.maskType) {
        case 0:
          totalPhase = (angleshirez[swapindex[i]] * phaseMultAngle);
          break;
        case 1:
          totalPhase = (swapindex[i] * phaseMultIndex);
          break;
        // case 2:
        //   totalPhase = (coordhirez[swapindex[i]] * phaseMultCoord);
        //   break;
      }

      totalPhase += (rotationNormalized + (radHiRez * curveNormalized));

      // use int wrap instead of fmod:
      // On ARM, negative floats cast to unsigned types are clipped at 0 instead of wrapped.
      // Bridge Cast allows wrap-around behavior: Float -> Signed Int -> Unsigned Int
      uint16_t normalizedPos16 = static_cast<uint16_t>(static_cast<int32_t>(totalPhase * 65536.0f));

      if (isFirstPattern) {
        // High byte of uint16_t gives a uint8_t value
        angleOffsets[i] = normalizedPos16 >> 8;
      }

      // Calculate pinwheel division's fade ins and outs, eased via the LUT.
      // One float multiply converts the position into a LUT index; the easing
      // and fade ramp are then pure integer math (no FPU on Teensy 3.2).
      uint8_t dimmermask;
      if (normalizedPos16 < divisionWidthFixed) {
        float idxF;
        uint8_t fadeLow, fadeHigh;
        if (normalizedPos16 < peakPosFixed) {
          // Fade in from fadeIn8 to 255 across [0, peakPos]
          idxF = static_cast<float>(normalizedPos16) * invPeakPos255;
          fadeLow = fadeIn8;
          fadeHigh = 255;
        } else {
          // Fade out from 255 to fadeOut8 across [peakPos, divisionWidth]
          idxF = static_cast<float>(normalizedPos16 - peakPosFixed) * invFadeSpan255;
          fadeLow = 255;
          fadeHigh = fadeOut8;
        }
        uint8_t idx = (idxF >= 255.0f) ? 255 : static_cast<uint8_t>(idxF);
        dimmermask = lerp8(fadeLow, fadeHigh, smootherstepLUT[idx]);
      } else {
        dimmermask = 0;
      }

      // Calculate fade out above certain radius, eased via the LUT, then
      // combine division fade, radius fade, and brightness into one integer
      // scale so the LED gets a single nscale8.
      float radiiIdxF = (radHiRez - radiusCutoff) * radiusFadeInv255;
      uint8_t radiiIdx = (radiiIdxF >= 255.0f) ? 255 : ((radiiIdxF <= 0.0f) ? 0 : static_cast<uint8_t>(radiiIdxF));
      uint8_t radiiScale = 255 - smootherstepLUT[radiiIdx];

      leds[i].nscale8(scale8(scale8(dimmermask, brightness8), radiiScale));
    }

    // https://fastled.io/docs/d3/d1d/group___power.html
    // https://claude.ai/share/1782f5d0-30c7-4602-b243-702217ad913f
    uint8_t powerBrightness = calculate_max_brightness_for_power_mW(leds, NUM_LEDS, 255, MAX_POWER_MW);
    nscale8(leds, NUM_LEDS, powerBrightness);

    // Transfer the data from FastLED's format to OctoWS2811
    for (int i = 0; i < ledsPerStrip * numStrips; i++) {
      octo.setPixel(i, leds[i].r, leds[i].g, leds[i].b);
    }

    // Display once per frame
    octo.show();
  }
}

void recvWithStartEndMarkers() {
  static boolean recvInProgress = false;
  static int ndx = 0;
  int startMarker = 254;
  int endMarker = 255;

  if (Serial.available() > 0) {
    int rc = Serial.read();
    if (recvInProgress == true) {
      if (rc != endMarker) {
        if (ndx < sizeofparams) {
          receivedChars[ndx] = rc;
          ndx++;
        }
      } else  // when rc == endMarker
      {
        recvInProgress = false;
        ndx = 0;
        newData = true;
      }
    } else if (rc == startMarker) {
      recvInProgress = true;
    }
  }
}

void test() {
  for (int i = 0; i < ledsPerStrip * numStrips; i++) {
    octo.setPixel(i, random(0, 128), random(0, 128), random(0, 128));
    octo.show();
    delay(20);
    octo.setPixel(i, 0, 0, 0);
    octo.show();
  }
}

void nextPalette() {
  // Store the previous palette index
  uint8_t previousPalette = params.currentPaletteIndex;

  // Keep selecting random palettes until we get one different from the previous
  do {
    params.currentPaletteIndex = random8(paletteCount);
  } while (params.currentPaletteIndex == previousPalette);

  // Set the target — don't update currentPalette directly
  targetPalette = palettes[params.currentPaletteIndex];
}

void nextPattern() {
  // Store the previous pattern index
  uint8_t previousPattern = currentPatternIndex;

  // Keep selecting random patterns until we get one different from the previous
  do {
    currentPatternIndex = random8(patternCount);
  } while (currentPatternIndex == previousPattern);
}

void divisionPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - angleOffsets[i]);
  }
}

// 2D map examples:

void clockwisePalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + angles[swapindex[i]]);
  }
}

void counterClockwisePalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - angles[swapindex[i]]);
  }
}

void outwardPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - radii[swapindex[i]]);
  }
}

void inwardPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + radii[swapindex[i]]);
  }
}

void northPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - coordsY[swapindex[i]]);
  }
}

void northEastPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - (coordsX[swapindex[i]] + coordsY[swapindex[i]]));
  }
}

void eastPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - coordsX[swapindex[i]]);
  }
}

void southEastPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt - coordsX[swapindex[i]] + coordsY[swapindex[i]]);
  }
}

void southPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + coordsY[swapindex[i]]);
  }
}

void southWestPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + coordsX[swapindex[i]] + coordsY[swapindex[i]]);
  }
}

void westPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + coordsX[swapindex[i]]);
  }
}

void northWestPalette() {
  for (uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i] = ColorFromPalette(currentPalette, gradientOffsetInt + coordsX[swapindex[i]] - coordsY[swapindex[i]]);
  }
}

// standard FastLED demo reel examples:

void rainbow() {
  // FastLED's built-in rainbow generator
  fill_rainbow(leds, NUM_LEDS, gradientOffsetInt, 7);
}

void rainbowWithGlitter() {
  // built-in FastLED rainbow, plus some random sparkly glitter
  rainbow();
  addGlitter(80);
}

void addGlitter(fract8 chanceOfGlitter) {
  if (random8() < chanceOfGlitter) {
    leds[random16(NUM_LEDS)] += CRGB::White;
  }
}

void confetti() {
  // random colored speckles that blink in and fade smoothly
  fadeToBlackBy(leds, NUM_LEDS, 10);
  int pos = random16(NUM_LEDS);
  leds[pos] += CHSV(gradientOffsetInt + random8(64), 200, 255);
}

void sinelon() {
  // a colored dot sweeping back and forth, with fading trails
  fadeToBlackBy(leds, NUM_LEDS, 20);
  int pos = beatsin16(13, 0, NUM_LEDS - 1);
  leds[pos] += CHSV(gradientOffsetInt, 255, 192);
}

void bpm() {
  // colored stripes pulsing at a defined Beats-Per-Minute (BPM)
  uint8_t BeatsPerMinute = 62;
  CRGBPalette16 palette = PartyColors_p;
  uint8_t beat = beatsin8(BeatsPerMinute, 64, 255);
  for (int i = 0; i < NUM_LEDS; i++) {  // 9948
    leds[i] = ColorFromPalette(palette, gradientOffsetInt + (i * 2), beat - gradientOffsetInt + (i * 10));
  }
}

const byte dotCount = 3;
const byte hues = 240 / dotCount;

void juggle() {
  // eight colored dots, weaving in and out of sync with each other
  fadeToBlackBy(leds, NUM_LEDS, 20);
  for (int i = 0; i < dotCount; i++) {
    leds[beatsin16(i + 7, 0, NUM_LEDS - 1)] |= CHSV(i * hues, 200, 255);
  }
}
