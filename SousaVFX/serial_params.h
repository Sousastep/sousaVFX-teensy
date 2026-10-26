#pragma once

//
// all params range from 0 to 253 due to using 254 and 255 as start and end markers
// for incoming serial data via recvWithStartEndMarkers()
// https://gist.github.com/embaster/642fed1680bd521baf674614583faaad
//
struct VFXParams {
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
  uint8_t maskType = 0;
} params;

const uint8_t sizeofparams = sizeof(VFXParams);
constexpr float paramNorm = 1.0f / 253.0f;
uint8_t receivedChars[sizeofparams];
boolean newData = false;

void recvWithStartEndMarkers() {
  static boolean recvInProgress = false;
  static int ndx = 0;
  int startMarker = 254;
  int endMarker = 255;

  if (Serial.available() > 0) {
    int rc = Serial.read();
    if (recvInProgress == true) {
      if (rc != endMarker) {
        if (ndx < sizeofparams) {
          receivedChars[ndx] = rc;
          ndx++;
        }
      } else  // when rc == endMarker
      {
        recvInProgress = false;
        ndx = 0;
        newData = true;
      }
    } else if (rc == startMarker) {
      recvInProgress = true;
    }
  }
}
