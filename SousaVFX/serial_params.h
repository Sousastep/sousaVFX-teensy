#pragma once

//
// VFXParams arrive COBS-encoded and terminated by a 0x00 byte, so every param
// can use the full 0..255 range. COBS guarantees 0x00 never appears inside an
// encoded frame, so if the cable is unplugged and plugged back in, the receiver
// resyncs on the next 0x00 and the partial frame fails the length check.
// https://en.wikipedia.org/wiki/Consistent_Overhead_Byte_Stuffing
//
struct VFXParams {
  uint8_t brightness = 80;
  uint8_t radiusCutoff = 255;
  uint8_t currentPaletteIndex = 0;
  uint8_t divisionHi = 3;
  uint8_t divisionLo = 0;
  uint8_t divisionWidth = 127;
  uint8_t divisionCurve = 127;
  uint8_t rotation = 0;
  uint8_t fadeIn = 255;
  uint8_t fadeOut = 255;
  uint8_t peakPos = 127;
  uint8_t pattern = 0;
  uint8_t gradientOffset = 0;
  uint8_t maskType = 0;
} params;

const uint8_t sizeofparams = sizeof(VFXParams);
constexpr float paramNorm = 1.0f / 255.0f;
uint8_t receivedChars[sizeofparams];
boolean newData = false;

// Longest COBS encoding of one VFXParams: one overhead byte per 254 data bytes.
constexpr size_t maxEncodedLen = sizeofparams + sizeofparams / 254 + 1;

// Decodes one COBS frame (without its 0x00 delimiter) from src into dst.
// Returns the decoded length, or 0 if the frame is malformed or won't fit in dst.
size_t cobsDecode(const uint8_t *src, size_t srcLen, uint8_t *dst, size_t dstMax) {
  size_t readIdx = 0;
  size_t writeIdx = 0;
  while (readIdx < srcLen) {
    uint8_t code = src[readIdx++];
    if (code == 0 || readIdx + code - 1 > srcLen) {
      return 0;
    }
    for (uint8_t i = 1; i < code; i++) {
      if (writeIdx >= dstMax) {
        return 0;
      }
      dst[writeIdx++] = src[readIdx++];
    }
    // A code below 0xFF stands for a zero after its block, except at the end of the frame.
    if (code < 0xFF && readIdx < srcLen) {
      if (writeIdx >= dstMax) {
        return 0;
      }
      dst[writeIdx++] = 0;
    }
  }
  return writeIdx;
}

void recvCOBSFrames() {
  static uint8_t encoded[maxEncodedLen];
  static size_t encodedLen = 0;
  static boolean overflowed = false;
  uint8_t decoded[sizeofparams];

  // Drain everything available so params never lag behind the sender.
  while (Serial.available() > 0) {
    uint8_t rc = Serial.read();
    if (rc != 0) {
      if (encodedLen < maxEncodedLen) {
        encoded[encodedLen++] = rc;
      } else {
        overflowed = true;
      }
      continue;
    }

    // 0x00 ends a frame. Decode into a scratch buffer so a bad frame never
    // touches receivedChars, and accept only exactly one VFXParams worth of data.
    if (!overflowed && cobsDecode(encoded, encodedLen, decoded, sizeofparams) == sizeofparams) {
      memcpy(receivedChars, decoded, sizeofparams);
      newData = true;
    }
    encodedLen = 0;
    overflowed = false;
  }
}
