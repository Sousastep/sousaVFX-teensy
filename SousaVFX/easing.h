#pragma once

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
