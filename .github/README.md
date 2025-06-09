<div align="center">

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?logo=linktree&style=flat-square&color=029900)](https://www.sousastep.quest/links/) [![Discord](https://img.shields.io/discord/1044699978993504368?label=Discord&logo=discord&logoColor=5865F2&style=flat-square&color=5865F2)](https://discord.gg/feBwTZt84d) [![Twitch Status](https://img.shields.io/twitch/status/sousastep?label=Twitch&logo=twitch&style=flat-square)](https://www.twitch.tv/sousastep) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square&color=029900)](https://makeapullrequest.com) 

</div>

<a href="#studio_microphone-introduction">![rainbow](./media/rainbow.png)</a>

# :studio_microphone: Introduction

The [teensy](https://www.pjrc.com/store/teensy40.html) receives serial data via USB and uses the [octows2811](https://www.pjrc.com/store/octo28_adaptor.html) adapter to send rgb data to the LEDs.

Serial data can be sent from either a mac running [sousaVFX](https://doc.sousastep.quest/content/sousavfx.html), or a raspberry pi running [sousaFX-rnbo](https://github.com/Sousastep/SousaFX-rnbo).

The teensy auto-detects whether it's connected to a mac or rpi by measuring the frame size of the incoming serial data.

Each frame's start marker is 254, and end marker is 255. SousaVFX sends hundreds of rgb values in each frame. sousaFX-rnbo sends three parameter values in each frame, and relies on the teensy to generate visuals.

<a href="#control_knobs-hardware">![rainbow](./media/rainbow.png)</a>

# :control_knobs: Hardware

https://edu.sousastep.quest/content/tutorials/LED-sousa-bell.html#materials

<a href="#">![rainbow](./media/rainbow.png)</a>
