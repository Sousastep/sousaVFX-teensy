#pragma once

uint8_t gradientOffsetInt = 0;
uint8_t angleOffsets[NUM_LEDS];

void divisionPalette();
void clockwisePalette();
void counterClockwisePalette();
void outwardPalette();
void inwardPalette();
void northPalette();
void northEastPalette();
void eastPalette();
void southEastPalette();
void southPalette();
void southWestPalette();
void westPalette();
void northWestPalette();
void rainbow();
void rainbowWithGlitter();
void addGlitter(fract8 chanceOfGlitter);
void confetti();
void sinelon();
void bpm();
void juggle();

// List of patterns to cycle through.  Each is defined as a separate function below.
typedef void (*SimplePatternList[])();
SimplePatternList patterns = {
    // 2D map examples:
    divisionPalette, outwardPalette, inwardPalette, clockwisePalette, counterClockwisePalette, northPalette,
    northEastPalette, eastPalette, southEastPalette, southPalette, southWestPalette, westPalette, northWestPalette,
    // standard FastLED demo reel examples:
    rainbow, rainbowWithGlitter, confetti, sinelon, juggle, bpm};

const uint8_t patternCount = ARRAY_SIZE(patterns);
uint8_t currentPatternIndex = 0;

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
