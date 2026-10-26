#include <OctoWS2811.h>
#include <algorithm>
#include <vector>
#define USE_OCTOWS2811
#include <FastLED.h>
// FASTLED_USING_NAMESPACE was removed in FastLED 3.10.x: the public API
// (CRGB, CHSV, FastLED, ColorFromPalette, ...) is now exported into the
// global namespace directly by the library.

#define FRAMES_PER_SECOND 260
#define ARRAY_SIZE(A) (sizeof(A) / sizeof((A)[0]))

// Each module may use anything from the modules included above it.
#include "coordinate_maps.h"  // LED buffer, wiring -> fibonacci index, coordinate maps
#include "palettes.h"         // gradient palette definitions
#include "easing.h"           // clamp, lerp, smootherstep + LUT
#include "serial_params.h"    // VFXParams and serial receive
#include "led_output.h"       // OctoWS2811 setup, power limit, and display
#include "palette_blend.h"    // palette selection and crossfade
#include "patterns.h"         // pattern functions and pattern list
#include "pinwheel_mask.h"    // pinwheel division / radius mask

const uint16_t frameInterval = 1000000 / FRAMES_PER_SECOND;
unsigned long previousMicros = 0;

void setup() {
  Serial.begin(115200);
  buildSmootherstepLUT();
  buildCoordinateMaps();
  FastLED.setBrightness(BRIGHTNESS);
  octo.begin();
  test();
}

void loop() {
  recvWithStartEndMarkers();
  unsigned long currentMicros = micros();
  if ((newData) && (currentMicros - previousMicros >= frameInterval)) {
    newData = false;
    previousMicros = currentMicros;
    memcpy(&params, receivedChars, sizeofparams);
    updatePaletteBlend(currentMicros);

    float gradientOffsetNorm = params.gradientOffset * paramNorm;
    gradientOffsetInt = static_cast<int8_t>(gradientOffsetNorm * 255.0f);

    patterns[params.pattern]();
    applyPinwheelMask();
    showLeds();
  }
}
