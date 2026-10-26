#pragma once

#define LED_TYPE WS2812B
#define COLOR_ORDER GRB
#define BRIGHTNESS 0
#define MAX_POWER_MW 40000

const int config = WS2811_GRB | WS2811_800kHz;  // why's this differ from #define LED_TYPE ?
const int ledsPerStrip = 26;
const int numStrips = 8;
const int numChannels = ledsPerStrip * numStrips * 3;
DMAMEM int displayMemory[ledsPerStrip * 6];
int drawingMemory[ledsPerStrip * 6];
OctoWS2811 octo(ledsPerStrip, displayMemory, drawingMemory, config);

void test() {
  for (int i = 0; i < ledsPerStrip * numStrips; i++) {
    octo.setPixel(i, random(0, 128), random(0, 128), random(0, 128));
    octo.show();
    delay(20);
    octo.setPixel(i, 0, 0, 0);
    octo.show();
  }
}

void showLeds() {
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
