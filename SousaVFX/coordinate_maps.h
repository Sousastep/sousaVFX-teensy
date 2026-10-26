// meant for 8 rows of 25 LEDs, accidentally added one extra LED because, 
// over the course of two sessions, the projector used to line up the LEDs
// wasn't perfectly aligned the same way both times,
// which projected one point in two spots between the two sessions.
// thus, to account for one strand having 26 LEDs, 
// 7 indicies at the end of 7 strands are "null", 
// and the two duplicate LEDs share a fibonacci index.

#define NUM_LEDS 208
CRGB leds[NUM_LEDS];

#define NUM_FIB_POINTS 201

// fibonacci index of each LED, in wiring order (from swapindex.txt)
// fibonacci index 0 is the center point, used for the null LEDs
// the coordinate arrays below are in fibonacci order, so access them as
// coordsX[swapindex[i]] where i is the wiring index
byte swapindex[NUM_LEDS] = {
    192, 171, 150, 129, 108, 87,  66,  45,  32,  53,  74,  95,  116, 137, 158,
    179, 200, 187, 166, 145, 124, 103, 82,  61,  40,  0,   189, 168, 147, 126,
    105, 84,  63,  42,  29,  37,  58,  79,  100, 121, 142, 163, 184, 197, 176,
    155, 134, 113, 92,  71,  50,  0,   186, 165, 144, 123, 102, 81,  60,  39,
    26,  34,  55,  76,  97,  118, 139, 160, 181, 194, 173, 152, 131, 110, 89,
    68,  47,  0,   190, 169, 148, 127, 106, 85,  64,  43,  35,  56,  77,  98,
    119, 140, 161, 182, 195, 174, 153, 132, 111, 90,  69,  48,  27,  0,   180,
    159, 138, 117, 96,  75,  54,  33,  20,  15,  7,   2,   3,   11,  24,  19,
    14,  22,  17,  25,  12,  4,   1,   6,   9,   0,   193, 172, 151, 130, 109,
    88,  67,  46,  38,  59,  80,  101, 122, 143, 164, 185, 198, 177, 156, 135,
    114, 93,  72,  51,  30,  0,   191, 170, 149, 128, 107, 86,  65,  44,  23,
    10,  5,   8,   16,  29,  21,  13,  18,  31,  52,  73,  94,  115, 136, 157,
    178, 199, 188, 167, 146, 125, 104, 83,  62,  41,  28,  49,  70,  91,  112,
    133, 154, 175, 196, 183, 162, 141, 120, 99,  78,  57,  36,  0};

// coordinate maps, in fibonacci order, filled by buildCoordinateMaps().
// fibonacci point n sits at angle n * golden angle, at distance sqrt(n) from
// the center. byte maps are 0..255 versions of the float maps.
byte coordsX[NUM_FIB_POINTS];
byte coordsY[NUM_FIB_POINTS];
byte angles[NUM_FIB_POINTS];
byte radii[NUM_FIB_POINTS];
// x coordinate scaled so the outermost point is 400 from the center
float coordhirez[NUM_FIB_POINTS];
// need high-rez angles (degrees) for crispy-looking pinwheel mask / fibonacci spiral moire pattern
float angleshirez[NUM_FIB_POINTS];
// need high-rez radii for crispy-looking circular warping. 0 at point 1, 255 at
// the outermost point
float radiihirez[NUM_FIB_POINTS];

void buildCoordinateMaps() {
  // the golden ratio
  const float phi = (1.0f + sqrtf(5.0f)) / 2.0f;
  // the golden angle splits a full turn in the golden ratio, ~137.508 degrees
  const float goldenAngleDeg = 360.0f * (1.0f - 1.0f / phi);
  const float maxRootN = sqrtf(NUM_FIB_POINTS - 1);
  for (int n = 0; n < NUM_FIB_POINTS; n++) {
    float rootN = sqrtf(n);
    float dist = rootN / maxRootN;  // 0..1 from center to outermost point
    float theta = fmodf(n * goldenAngleDeg, 360.0f);
    float cosTheta = cosf(theta * DEG_TO_RAD);
    float sinTheta = sinf(theta * DEG_TO_RAD);

    angleshirez[n] = theta;
    // point 0 is the center (used by the null LEDs), clamp it to 0 too
    radiihirez[n] = max(0.0f, 255.0f * (rootN - 1.0f) / (maxRootN - 1.0f));
    coordhirez[n] = 400.0f * dist * cosTheta;

    // lroundf can give 256 for angles just under 360, which wraps to 0
    angles[n] = static_cast<uint8_t>(lroundf(theta * (256.0f / 360.0f)));
    radii[n] = static_cast<uint8_t>(radiihirez[n] + 0.5f);
    coordsX[n] = static_cast<uint8_t>(127.5f + 127.5f * dist * cosTheta + 0.5f);
    coordsY[n] = static_cast<uint8_t>(127.5f + 127.5f * dist * sinTheta + 0.5f);
  }
}
