#include <OctoWS2811.h>
#define USE_OCTOWS2811
#include <FastLED.h> // https://github.com/FastLED/FastLED
FASTLED_USING_NAMESPACE
#define LED_TYPE WS2812B
#define COLOR_ORDER GRB
#define BRIGHTNESS 0

#include "coordinate_maps.h"

#define FRAMES_PER_SECOND 160
const int frameInterval = ((1000 / FRAMES_PER_SECOND) * 1);
const int micInterval = (100);
#define ARRAY_SIZE(A) (sizeof(A) / sizeof((A)[0]))

uint8_t offset = 0; // rotating "base color" used by many of the patterns
uint8_t speed = 12;

boolean autoplay = false;
uint8_t autoplaySeconds = 45;

// Define constants
const int config = WS2811_GRB | WS2811_800kHz; // why's this differ from #define LED_TYPE ?
const int ledsPerStrip = 26;
const int numStrips = 8;
const int numChannels = ledsPerStrip * numStrips * 3;
const int maxDataLength = 700; //failsafe incase end marker doesn't appear or something
const int electretMicEnabled = 0;

// Declare variables
char serial_array[numChannels];
int serial_array_length = 0;
DMAMEM int displayMemory[ledsPerStrip * 6];
int drawingMemory[ledsPerStrip * 6];
char receivedChars[numChannels + 1];
boolean newData = false;        // newData is used to determine if there is a new command
unsigned long previousMillis = 0;  // will store last time mic was updated
unsigned long previousMicros = 0;
unsigned long previousMillisLED = 0;  // will store last time LED was updated
unsigned long previousPatternMillis = 0;
unsigned long previousPaletteMillis = 0;
int vfx_env = 255;

int brightnessParam = 80;
int radiusCutoffParam = 253;
uint8_t currentPaletteIndex = 0;
int pinwheelDivisions = 3;
int divisionWidth = 126;
int divisionCurveParam = 126;
int rotationParam = 0;

float maskbrightnesscurve = 0;

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
static DeviceType currentDevice = RASPBERRY_PI;
static int frameCount = 0;
static int frameLengths[10]; // Store recent frame lengths for analysis

void setup()
{
  random16_set_seed(analogRead(A0));

  Serial.begin(115200);

  // initialize all the readings to 0:
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }

  FastLED.setBrightness(BRIGHTNESS);

  octo.begin();
  test();
}

// List of patterns to cycle through.  Each is defined as a separate function below.
typedef void (*SimplePatternList[])();
SimplePatternList patterns = {
    // 2D map examples:
     // clockwisePalette,
     // counterClockwisePalette,
    outwardPalette,
    inwardPalette,
    // northPalette,
    //northEastPalette,
    //eastPalette,
    //southEastPalette,
    //southPalette,
    // southWestPalette,
    //westPalette,
    //northWestPalette,

    // standard FastLED demo reel examples:
    //  rainbow,
    //  rainbowWithGlitter,
    //  confetti,
    //  sinelon,
    //  juggle,
    //  bpm
};

const uint8_t patternCount = ARRAY_SIZE(patterns);

uint8_t currentPatternIndex = 0; // Index number of which pattern is current

CRGBPalette16 IceColors_p = CRGBPalette16(CRGB::Black, CRGB::Blue, CRGB::Aqua, CRGB::White);


#include "palettes.h"


// Count of how many cpt-city gradients are defined:
const uint8_t paletteCount = ARRAY_SIZE(palettes);

uint8_t previousPalette = 0;
CRGBPalette16 currentPalette = palettes[currentPaletteIndex];

boolean autoplayPalettes = false;
uint8_t autoplayPaletteSeconds = autoplaySeconds * patternCount;

uint8_t ease8InQuad(uint8_t i) {
    uint16_t i2 = i * i;  // Square the input (0-255 * 0-255 = 0-65025)
    return i2 / 255;      // Scale back to 0-255 range
}


uint8_t ease8OutQuad(uint8_t i) {
    uint16_t inv = 255 - i;  // Invert the input
    uint16_t inv2 = inv * inv;  // Square the inverted input
    return 255 - (inv2 / 255);  // Scale back and invert to create ease out effect
}

uint8_t applyExponentialCurve(uint8_t value, float curve) {
  float normalized = value / 255.0f;
  float curved;

  if (curve > 0.0f) {
    curved = pow(normalized, curve);
  } else if (curve < 0.0f) {
    curved = 1.0f - pow(1.0f - normalized, -curve);
  } else {
    curved = normalized;  // linear if curve == 0
  }

  return uint8_t(curved * 255.0f);
}

double clamp(double d, double min, double max) {
  const double t = d < min ? min : d;
  return t > max ? max : t;
}

float fmap(float x, float in_min, float in_max, float out_min, float out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void loop() {

  // get rnbo's outport values from rpi via usb serial
  if (!electretMicEnabled) {    // if electret mic connected directly to teensy is disabled, read from serial input
    recvWithStartEndMarkers();  // check to see if we have received any new commands
    if (newData && currentDevice == RASPBERRY_PI) {
      brightnessParam = receivedChars[0];
      radiusCutoffParam = receivedChars[1];
      currentPaletteIndex = receivedChars[2];
      pinwheelDivisions = receivedChars[3];
      divisionWidth = receivedChars[4];
      divisionCurveParam = receivedChars[5];
      rotationParam = receivedChars[6];

      if (previousPalette != currentPaletteIndex) {
      currentPalette = palettes[currentPaletteIndex];
      previousPalette = currentPaletteIndex;
      }
    }
  }

  // Current time
  unsigned long currentMillis = millis();
  unsigned long currentMicros = micros();
  
  if ((currentMicros - previousMicros >= (micInterval)) && electretMicEnabled && currentDevice == UNKNOWN) {
      // subtract the last reading:
    total = total - readings[readIndex];
      // read from the sensor:
    readings[readIndex] = std::clamp(analogRead(analogInPin), 700, 715);
      // add the reading to the total:
    total = total + readings[readIndex];
    
      // Track the peak value
    if (readings[readIndex] > peak) {
      peak = readings[readIndex];
    }
  
      // advance to the next position in the array:
    readIndex = readIndex + 1;

      // if we're at the end of the array...
    if (readIndex >= numReadings) {
      
        // Apply asymmetric smoothing
      if (peak > smoothedValue) {
          smoothedValue += alphaUp * (peak - smoothedValue);
      } else {
          smoothedValue += alphaDown * (peak - smoothedValue);
      }

      vfx_env = ease8OutQuad(std::clamp((int)map(smoothedValue, 700, 715, 0, 255), 0, 255));

      Serial.print(0); // To freeze the lower limit
      Serial.print(" ");
      Serial.print(255); // To freeze the upper limit
      Serial.print(" ");
      Serial.println(vfx_env); // To send all three 'data' points to the plotter


        // ...wrap around to the beginning:
      readIndex = 0;
    
        // reset peak after each full cycle of readings
      peak = readings[readIndex];
    }
    previousMicros = currentMicros;
  }

  if (currentMillis - previousMillisLED >= frameInterval && currentDevice == RASPBERRY_PI) {
    // save the last time you blinked the LED
    previousMillisLED = currentMillis;

    // Call the current pattern function, updating the 'leds' array
    patterns[currentPatternIndex]();

    offset = beat8(speed);

    // Check if it's time to change patterns
    if (autoplay && (currentMillis - previousPatternMillis >= autoplaySeconds * 1000)) {
      previousPatternMillis = currentMillis;
      nextPattern();
    }

    // Check if it's time to change palettes
    if (autoplayPalettes && (currentMillis - previousPaletteMillis >= autoplaySeconds * 1000)) {
      previousPaletteMillis = currentMillis;
      nextPalette();
    }

    // moire patterns emerge with high numbers of divisions
    // inspired by mojovideotech's pinwheel shader https://editor.isf.video/shaders/5e7a7fe07c113618206de624
    const float TOTAL_ANGLE = 360.0f;
    const float TIME_DIVISOR = 1.0f / 120.0f;
    float angleSize = TOTAL_ANGLE / pinwheelDivisions;
    float invAngleSize = 1.0f / angleSize;
    // float angleRotationAmt = fmod(currentMillis * TIME_DIVISOR, angleSize); // use this line when only teensy with no rpi or mac
    float angleRotationAmt = angleSize * fmap(rotationParam, 0.0f, 253.0f, 0.0f, 1.0f );
    float divisionWidthNorm = fmap(divisionWidth, 0.0f, 253.0f, 1.0f, 0.0f );
    float divisionCurve = fmap(divisionCurveParam, 0.0f, 253.0f, -3.0f, 3.0f) / pinwheelDivisions;

    for (int i = 0; i < NUM_LEDS; i++) {
      // float fadeAdjust = fmap(clamp((radii[i] + fadeParam), 0.0f , 255.0f), 0.0f, 255.0f, 12.0f, 0.0f ); // fadeParam
      float angleOffset = angleshirez[i] + angleRotationAmt + (radiihirez[i] * divisionCurve) + 360.0f;
      float angleDiff = fmod(angleOffset, angleSize);
      float normalizedPos = angleDiff * invAngleSize;
      int dimmermask = (normalizedPos < divisionWidthNorm) ? 0 : 255;
      // int dimmermask = (clamp(((normalizedPos * (1 + fadeAdjust)) - fadeAdjust), 0, 1) < 0.5f) ? 0 : 255;
      leds[i] = leds[i].scale8(dimmermask);

      if (radii[i] > radiusCutoffParam) {
        leds[i] = CRGB::Black;
      }
      
      leds[i] = leds[i].scale8(fmap(brightnessParam, 0.0f, 253.0f, 0.0f, 200.0f ));
    }

    // Transfer the data from FastLED's format to OctoWS2811
    for (int i = 0; i < ledsPerStrip * numStrips; i++) {
      octo.setPixel(i, leds[i].r, leds[i].g, leds[i].b);
    }
  
    // Display once per frame
    octo.show();
  
  }

  if (currentDevice == MAC_MAX) {
    if (newData)  {
      for (int i = 0; i < ledsPerStrip * numStrips ; i++)
        octo.setPixel(i, receivedChars[i * 3], receivedChars[i * 3 + 1], receivedChars[i * 3 + 2]);
      octo.show();
      newData = false;
    }
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
        if (ndx < maxDataLength) {
          receivedChars[ndx] = rc;
          ndx++;
        }
      }
      else // when rc == endMarker
      {
        receivedChars[ndx] = '\0'; // terminate the string
        recvInProgress = false;

        // Device detection based on frame length
        if (currentDevice == UNKNOWN && frameCount < 10) {
          frameLengths[frameCount] = ndx;
          frameCount++;
          
          if (frameCount >= 3) { // Analyze after 3 frames
            detectDeviceType();
          }
        }

        ndx = 0;
        newData = true;
      }
    }
    else if (rc == startMarker) {
      recvInProgress = true;
    }
  }
}

void detectDeviceType() {
  int avgLength = 0;
  for (int i = 0; i < frameCount; i++) {
    avgLength += frameLengths[i];
  }
  avgLength /= frameCount;
  
  if (avgLength < 10) {
    currentDevice = RASPBERRY_PI;
  } else if (avgLength > 100) {
    currentDevice = MAC_MAX;
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
  uint8_t previousPalette = currentPaletteIndex;
  
  // Keep selecting random palettes until we get one different from the previous
  do {
    currentPaletteIndex = random8(paletteCount);
  } while (currentPaletteIndex == previousPalette);
  
  // Update the current palette
  currentPalette = palettes[currentPaletteIndex];
}

void nextPattern() {
  // Store the previous pattern index
  uint8_t previousPattern = currentPatternIndex;
  
  // Keep selecting random patterns until we get one different from the previous
  do {
    currentPatternIndex = random8(patternCount);
  } while (currentPatternIndex == previousPattern);
}

// 2D map examples:

void clockwisePalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + angles[i]);
  }
}

void counterClockwisePalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - angles[i]);
  }
}

void outwardPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - radii[i]);
  }
}

void inwardPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + radii[i]);
  }
}

void northPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - coordsY[i]);
  }
}

void northEastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - (coordsX[i] + coordsY[i]));
  }
}

void eastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - coordsX[i]);
  }
}

void southEastPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset - coordsX[i] + coordsY[i]);
  }
}

void southPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + coordsY[i]);
  }
}

void southWestPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + coordsX[i] + coordsY[i]);
  }
}

void westPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + coordsX[i]);
  }
}

void northWestPalette()
{
  for (uint16_t i = 0; i < NUM_LEDS; i++)
  {
    leds[i] = ColorFromPalette(currentPalette, offset + coordsX[i] - coordsY[i]);
  }
}

// standard FastLED demo reel examples:

void rainbow()
{
  // FastLED's built-in rainbow generator
  fill_rainbow(leds, NUM_LEDS, offset, 7);
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
  leds[pos] += CHSV(offset + random8(64), 200, 255);
}

void sinelon()
{
  // a colored dot sweeping back and forth, with fading trails
  fadeToBlackBy(leds, NUM_LEDS, 20);
  int pos = beatsin16(13, 0, NUM_LEDS - 1);
  leds[pos] += CHSV(offset, 255, 192);
}

void bpm()
{
  // colored stripes pulsing at a defined Beats-Per-Minute (BPM)
  uint8_t BeatsPerMinute = 62;
  CRGBPalette16 palette = PartyColors_p;
  uint8_t beat = beatsin8(BeatsPerMinute, 64, 255);
  for (int i = 0; i < NUM_LEDS; i++)
  { // 9948
    leds[i] = ColorFromPalette(palette, offset + (i * 2), beat - offset + (i * 10));
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


