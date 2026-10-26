#pragma once

const uint8_t paletteCount = ARRAY_SIZE(palettes);
uint8_t previousPalette = 0;
CRGBPalette16 currentPalette = palettes[params.currentPaletteIndex];
CRGBPalette16 targetPalette = currentPalette;

// Palette crossfade state — eased with smootherstep over paletteBlendSeconds.
unsigned long paletteBlendStartMicros = 0;
float paletteBlendProgress = 0.0f;  // last frame's smoothed progress (0..1)
constexpr float paletteBlendSeconds = 1.0f;

void updatePaletteBlend(unsigned long currentMicros) {
  if (previousPalette != params.currentPaletteIndex) {
    targetPalette = palettes[params.currentPaletteIndex];
    previousPalette = params.currentPaletteIndex;
    paletteBlendStartMicros = currentMicros;
    paletteBlendProgress = 0.0f;
  }

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
