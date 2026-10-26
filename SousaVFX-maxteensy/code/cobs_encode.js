// cobs_encode.js — for Max's [v8 cobs_encode.js]
//
// COBS-encodes a list of 0..255 ints and appends the 0 frame delimiter, ready
// for [serial]. Matches recvCOBSFrames() in SousaVFX/serial_params.h.
// https://en.wikipedia.org/wiki/Consistent_Overhead_Byte_Stuffing
//
// inlet 0:  list (or single int) of bytes, 0..255
// outlet 0: encoded bytes followed by 0, as one list

inlets = 1;
outlets = 1;
autowatch = 1;

setinletassist(0, "list of bytes (0..255) to encode");
setoutletassist(0, "COBS-encoded list, ending in 0");

function cobsEncode(bytes) {
  const out = [0];  // placeholder for the first code byte
  let codeIdx = 0;
  let code = 1;
  for (const b of bytes) {
    if (b === 0) {
      out[codeIdx] = code;
      codeIdx = out.length;
      out.push(0);
      code = 1;
    } else {
      out.push(b);
      code++;
      // A block holds at most 254 data bytes, so start a new one.
      if (code === 0xff) {
        out[codeIdx] = code;
        codeIdx = out.length;
        out.push(0);
        code = 1;
      }
    }
  }
  out[codeIdx] = code;
  out.push(0);  // frame delimiter
  return out;
}

function toByte(v) {
  const n = Math.round(Number(v));
  if (!Number.isFinite(n) || n < 0 || n > 255) {
    post("cobs_encode: clamping out-of-range value " + v + "\n");
  }
  return Number.isFinite(n) ? Math.min(255, Math.max(0, n)) : 0;
}

function list(...values) {
  outlet(0, cobsEncode(values.map(toByte)));
}

function msg_int(v) {
  list(v);
}

function msg_float(v) {
  list(v);
}
