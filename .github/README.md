<div align="center">

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?logo=linktree&style=flat-square&color=029900)](https://www.sousastep.quest/links/) [![Discord](https://img.shields.io/discord/1044699978993504368?label=Discord&logo=discord&logoColor=5865F2&style=flat-square&color=5865F2)](https://discord.gg/feBwTZt84d) [![Twitch Status](https://img.shields.io/twitch/status/sousastep?label=Twitch&logo=twitch&style=flat-square)](https://www.twitch.tv/sousastep)

</div>

<a href="#studio_microphone-introduction">![rainbow](./media/rainbow.png)</a>

# :studio_microphone: Introduction

This repository provides the code that creates the visual effects for Sousastep's LED sousaphone bell.

It requires [SousaFX-rnbo](https://github.com/Sousastep/SousaFX-rnbo).


<a href="#helicopter-overview">![rainbow](./media/rainbow.png)</a>

# :helicopter: Overview

The LEDs receive RGB data from the [Teensy](https://www.pjrc.com/store/teensy40.html) microcontroller via the [OctoWS2811](https://www.pjrc.com/store/octo28_adaptor.html) adapter.

The Teensy runs `SousaVFX.ino` to receive parameter values via USB, which can come from either a Mac running `SousaVFX-maxteensy.maxproj`, or a Raspberry Pi running [SousaFX-rnbo.rnbopat](https://github.com/Sousastep/sousaFX-rpi-scripts). These parameters are processed to calculate the RGB values for each LED.

```cpp
struct VFXParams {
  uint8_t brightness;
  uint8_t radiusCutoff;
  uint8_t currentPaletteIndex;
  uint8_t divisionHi;
  uint8_t divisionLo;
  uint8_t divisionWidth;
  uint8_t divisionCurve;
  uint8_t rotation;
  uint8_t fadeIn;
  uint8_t fadeOut;
  uint8_t peakPos;
  uint8_t pattern;
  uint8_t gradientOffset;
  uint8_t maskType;
} params;
```

These parameter values are provided by `SousaVFX.rnbopat`, which handles the presets, envelopes, modulation, and auto-switching logic. This logic is run by data from `SousaFX-rnbo.rnbopat`, which sends the following:

audio:
- Main Phasor
- Post-phase-locked-loop phasor
- Crossfade envelope with no transient helper
- Main Lowpass Filter Frequency Modulation
- Dry tuba + time effects envelope
- Drum + drum loop envelope

midi:
- Is tuba playing
- Is tuba soloing
- Main looper status
- Drum looper status
- Is bumper drumming enabled
- Is looper stutter enabled
- Drumkit randomization bang

The FPS maxes out around 260.

<a href="#control_knobs-hardware">![rainbow](./media/rainbow.png)</a>

# :control_knobs: Hardware

https://edu.sousastep.quest/content/tutorials/LED-sousa-bell.html#materials

<a href="#">![rainbow](./media/rainbow.png)</a>
