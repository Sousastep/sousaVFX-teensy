#pragma once

void applyPinwheelMask() {
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
}
