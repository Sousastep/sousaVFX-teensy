#include <OctoWS2811.h>
#define USE_OCTOWS2811
#include <FastLED.h>
FASTLED_USING_NAMESPACE
#define LED_TYPE WS2812B
#define COLOR_ORDER GRB
#define BRIGHTNESS 0

#include "coordinate_maps.h"

#define FRAMES_PER_SECOND 260
const uint16_t frameInterval = 1000000 / FRAMES_PER_SECOND;
#define ARRAY_SIZE(A) (sizeof(A) / sizeof((A)[0]))

const int config = WS2811_GRB | WS2811_800kHz; // why's this differ from #define LED_TYPE ?
const int ledsPerStrip = 26;
const int numStrips = 8;
const int numChannels = ledsPerStrip * numStrips * 3;
const int electretMicEnabled = 0;

char serial_array[numChannels];
int serial_array_length = 0;
DMAMEM int displayMemory[ledsPerStrip * 6];
int drawingMemory[ledsPerStrip * 6];
boolean newData = false;        // newData is used to determine if there is a new command
unsigned long previousMillis = 0;  // will store last time mic was updated
unsigned long previousMicros = 0;
unsigned long previousPatternMillis = 0;
unsigned long previousPaletteMillis = 0;

/* all params range from 0 to 253 due to using 254 and 255 as start and end markers 
 * for incoming serial data via recvWithStartEndMarkers() */
struct __attribute__((packed)) VFXParams {
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
} params;

const uint8_t sizeofparams = sizeof(VFXParams);
uint8_t receivedChars[sizeofparams];
uint8_t angleOffsets[NUM_LEDS];

OctoWS2811 octo(ledsPerStrip, displayMemory, drawingMemory, config);

#include <algorithm>
#include <vector>

// Smoothing parameters
const float alphaUp = 1;   // Smoothing factor for increasing values
const float alphaDown = 0.02; // Smoothing factor for decreasing values

float smoothedValue = 0;  // Holds the smoothed output

const int analogInPin = A4;  // Analog input pin that the potentiometer is attached to
const int numReadings = 80;

int readings[numReadings];  // the readings from the analog input
int readIndex = 0;          // the index of the current reading
int total = 0;              // the running total
int average = 0;            // the average
int peak = 0;               // the peak

int sensorValue = 0;  // value read from the pot

// Detect which device is connected
enum DeviceType { UNKNOWN, RASPBERRY_PI, MAC_MAX };
static int frameCount = 0;
static int frameLengths[10]; // Store recent frame lengths for analysis

void setup()
{
  random16_set_seed(analogRead(A0));
  Serial.begin(115200);
  FastLED.setBrightness(BRIGHTNESS);
  octo.begin();
  test();
}

// List of patterns to cycle through.  Each is defined as a separate function below.
typedef void (*SimplePatternList[])();
SimplePatternList patterns = {
    // 2D map examples:

    divisionPalette,
    outwardPalette,
    inwardPalette,
    clockwisePalette,
    counterClockwisePalette,
    northPalette,
    northEastPalette,
    eastPalette,
    southEastPalette,
    southPalette,
    southWestPalette,
    westPalette,
    northWestPalette,

    // standard FastLED demo reel examples:
    rainbow,
    rainbowWithGlitter,
    confetti,
    sinelon,
    juggle,
    bpm
};

const uint8_t patternCount = ARRAY_SIZE(patterns);

uint8_t currentPatternIndex = 0; // Index number of which pattern is current

CRGBPalette16 IceColors_p = CRGBPalette16(CRGB::Black, CRGB::Blue, CRGB::Aqua, CRGB::White);

#include "palettes.h"

// Count of how many cpt-city gradients are defined:
const uint8_t paletteCount = ARRAY_SIZE(palettes);

uint8_t previousPalette = 0;
CRGBPalette16 currentPalette = palettes[params.currentPaletteIndex];

void loop() {

  recvWithStartEndMarkers();  // check to see if we have received any new commands
  if (newData) {

    memcpy(&params, receivedChars, sizeofparams);
    
    if (previousPalette != params.currentPaletteIndex) {
    currentPalette = palettes[params.currentPaletteIndex];
    previousPalette = params.currentPaletteIndex;
    }
  }

  // Current time
  unsigned long currentMillis = millis();
  unsigned long currentMicros = micros();

  if (newData && currentMicros - previousMicros >= frameInterval) {
    previousMicros = currentMicros;

    // Call the current pattern function, updating the 'leds' array
    patterns[params.pattern]();

    // Moire patterns emerge with high numbers of divisions
    // inspired by: mojovideotech's pinwheel shader https://editor.isf.video/shaders/5e7a7fe07c113618206de624
    //              & Jason Coon's work https://github.com/jasoncoon/
    const float paramNorm = 1.0f / 253.0f ;

    // divisionLo represents the fractional part of the overall number of pinwheel divisions.
    // It's divided by 254 instead of 253 because divisionLo never needs to reach 1.
    // ( all params range from 0 to 253 due to recvWithStartEndMarkers )
    float divisionLo = (params.divisionLo / 254.0f) ;
    float pinwheelDivisions = params.divisionHi + divisionLo ;
    float pinwheelDivisionsInv = 1.0f / pinwheelDivisions ;
    float angleSize = 360.0f * pinwheelDivisionsInv ;

    // For some reason, while divisionLo goes from 0 to 1, 
    // the vfx does a 360 degree rotation with 4 divisions, 
    // a 180 deg rot with 8 div, or a 90 deg rot with 16 div,
    // which can be compensated for with the following expression:
    float angleRotationCompensation = (divisionLo * 360.0f) * (4.0f * pinwheelDivisionsInv) ;

    // Instead of doing a full 360 deg rot with params.rotation, 
    // it's multiplied by angleSize so it only moves one "division length", which causes a full rotation of the moire pattern.
    float angleRotationAmt = (angleSize * (params.rotation * paramNorm)) - angleRotationCompensation ;
    
    // The following helps fade each division in and out, triangularly.
    float fadeInNorm = params.fadeIn * paramNorm ;
    float fadeOutNorm = params.fadeOut * paramNorm ;
    float divisionWidthNorm = (params.divisionWidth * paramNorm) ;
    float peakPosNorm = (params.peakPos * paramNorm) * divisionWidthNorm ;
    float slopeIn = (fadeInNorm - 1.0f) / (0.0f - peakPosNorm) ;
    float slopeOut = (1.0f - fadeOutNorm) / (peakPosNorm - divisionWidthNorm) ;

    // Fade edge of radius cutoff.
    constexpr float radiusFadeLength = 0.08f ;
    constexpr float radiusCutoffSlope = 1.0f / (0.0f - radiusFadeLength) ;
    constexpr float radiiNorm = 1.0f / 255.0f ;
    float radiusCutoff = params.radiusCutoff * paramNorm * 255.0f ;

    // TODO: Use Power Management Functions https://fastled.io/docs/d3/d1d/group___power.html
    // Max brightness hardcoded to 70%
    float brightnessNorm = params.brightness * paramNorm * 0.7f ;

    // Divide curve amount by number of divisions to keep it sane.
    float divisionCurve = (((params.divisionCurve * paramNorm) * 6.0f) - 3.0f) * pinwheelDivisionsInv ;

    // gemini recommends uint16_t wrap instead of fmod 
    float divisionsPerCircle = pinwheelDivisions;
    float phaseMultiplier = (1.0f / 360.0f) * divisionsPerCircle;
    uint16_t divisionWidthFixed = divisionWidthNorm * 65535.0f;
    uint16_t peakPosFixed = peakPosNorm * 65535.0f;
    float rotationNormalized = angleRotationAmt * (1.0f / 360.0f) * divisionsPerCircle;
    float curveNormalized = divisionCurve * (1.0f / 360.0f) * divisionsPerCircle;

    float slopeIn255 = slopeIn * 255.0f;
    float slopeOut255 = slopeOut * 255.0f;

    // the result should be in the 0.0 - 255.0 range for the dimmermask
    // So multiply the original slope by 255 and divide by 65536
    const float scaleFactor = 255.0f / 65536.0f;
    float adjSlopeIn = slopeIn * scaleFactor;
    float adjSlopeOut = slopeOut * scaleFactor;

    bool firstPattern = (params.pattern == 0);

    float radiusCutoffNorm = params.radiusCutoff * paramNorm;

    float radiusCutoffEnd = radiusCutoff + (radiusFadeLength * 255.0f);

    for (int i = 0; i < NUM_LEDS; i++) {
      
      float totalPhase = (angleshirez[i] * phaseMultiplier) + rotationNormalized + (radiihirez[i] * curveNormalized);

      // use int wrap instead of fmod:
      // On ARM, negative floats cast to unsigned types are clipped at 0 instead of wrapped.
      // Bridge Cast allows wrap-around behavior: Float -> Signed Int -> Unsigned Int
      uint16_t normalizedPos16 = static_cast<uint16_t>(static_cast<int32_t>(totalPhase * 65536.0f));

      if (firstPattern) {
        // High byte of uint16_t gives a uint8_t value
        angleOffsets[i] = normalizedPos16 >> 8; 
      }

      // Calculate pinwheel division's fade ins and outs
      int32_t deltaFixed = static_cast<int32_t>(normalizedPos16) - static_cast<int32_t>(peakPosFixed);
      float currentSlope = (normalizedPos16 < peakPosFixed) ? adjSlopeIn : adjSlopeOut;
      float fade = (deltaFixed * currentSlope) + 255.0f;
      float gate = (normalizedPos16 < divisionWidthFixed) ? 1.0f : 0.0f;
      float dimmermask = (fmaxf(0.0f, fade) * gate);
      
      // Calculate fade out above certain radius
      float radiiFade;
      if (radiihirez[i] >= (radiusCutoffEnd)) {
        radiiFade = 0.0f;
      } else if (radiihirez[i] > radiusCutoff) {
        radiiFade = (radiusCutoffSlope * ((radiihirez[i] * radiiNorm) - radiusCutoffNorm) + 1.0f);
      } else {
        radiiFade = 1.0f;
      }

      leds[i].nscale8(radiiFade * dimmermask * brightnessNorm);

    }

    // Transfer the data from FastLED's format to OctoWS2811
    for (int i = 0; i < ledsPerStrip * numStrips; i++) {
      octo.setPixel(i, leds[i].r, leds[i].g, leds[i].b);
    }
  
    // Display once per frame
    octo.show();
  
  }
}

void recvWithStartEndMarkers()
{
  static boolean recvInProgress = false;
  static int ndx = 0;
  int startMarker = 254;
  int endMarker = 255;

  if (Serial.available() > 0)
  {
    int rc = Serial.read();
    if (recvInProgress == true)
    {
      if (rc != endMarker)
      {
        if (ndx < sizeofparams) {
          receivedChars[ndx] = rc;
          ndx++;
        }
      }
      else // when rc == endMarker
      {
        // receivedChars[ndx] = '\0'; // terminate the string
        recvInProgress = false;
        ndx = 0;
        newData = true;
      }
    }
    else if (rc == startMarker) {
      recvInProgress = true;
    }
  }
}

void test() {
  for (int i = 0; i < ledsPerStrip * numStrips ; i++) {
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
  
  // Update the current palette
  currentPalette = palettes[params.currentPaletteIndex];
}

void nextPattern() {
  // Store the previous pattern index
  uint8_t previousPattern = currentPatternIndex;
  
  // Keep selecting random patterns until we get one different from the previous
  do {
    currentPatternIndex = random8(patternCount);
  } while (currentPatternIndex == previousPattern);
}

// TODO: scale params.gradientOffset (it's 0 to 253 rn)

// division-based pattern

void divisionPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - angleOffsets[i]);
  }
}


// 2D map examples:

void clockwisePalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + angles[i]);
  }
}

void counterClockwisePalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - angles[i]);
  }
}

void outwardPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - radii[i]);
  }
}

void inwardPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + radii[i]);
  }
}

void northPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - coordsY[i]);
  }
}

void northEastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - (coordsX[i] + coordsY[i]));
  }
}

void eastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - coordsX[i]);
  }
}

void southEastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset - coordsX[i] + coordsY[i]);
  }
}

void southPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + coordsY[i]);
  }
}

void southWestPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + coordsX[i] + coordsY[i]);
  }
}

void westPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + coordsX[i]);
  }
}

void northWestPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, params.gradientOffset + coordsX[i] - coordsY[i]);
  }
}

// standard FastLED demo reel examples:

void rainbow()
{
  // FastLED's built-in rainbow generator
  fill_rainbow(leds, NUM_LEDS, params.gradientOffset, 7);
}

void rainbowWithGlitter()
{
  // built-in FastLED rainbow, plus some random sparkly glitter
  rainbow();
  addGlitter(80);
}

void addGlitter(fract8 chanceOfGlitter)
{
  if (random8() < chanceOfGlitter)
  {
    leds[random16(NUM_LEDS)] += CRGB::White;
  }
}

void confetti()
{
  // random colored speckles that blink in and fade smoothly
  fadeToBlackBy(leds, NUM_LEDS, 10);
  int pos = random16(NUM_LEDS);
  leds[pos] += CHSV(params.gradientOffset + random8(64), 200, 255);
}

void sinelon()
{
  // a colored dot sweeping back and forth, with fading trails
  fadeToBlackBy(leds, NUM_LEDS, 20);
  int pos = beatsin16(13, 0, NUM_LEDS - 1);
  leds[pos] += CHSV(params.gradientOffset, 255, 192);
}

void bpm()
{
  // colored stripes pulsing at a defined Beats-Per-Minute (BPM)
  uint8_t BeatsPerMinute = 62;
  CRGBPalette16 palette = PartyColors_p;
  uint8_t beat = beatsin8(BeatsPerMinute, 64, 255);
  for (int i = 0; i < NUM_LEDS; i++)
  { // 9948
    leds[i] = ColorFromPalette(palette, params.gradientOffset + (i * 2), beat - params.gradientOffset + (i * 10));
  }
}

const byte dotCount = 3;
const byte hues = 240 / dotCount;

void juggle()
{
  // eight colored dots, weaving in and out of sync with each other
  fadeToBlackBy(leds, NUM_LEDS, 20);
  for (int i = 0; i < dotCount; i++)
  {
    leds[beatsin16(i + 7, 0, NUM_LEDS - 1)] |= CHSV(i * hues, 200, 255);
  }
}


