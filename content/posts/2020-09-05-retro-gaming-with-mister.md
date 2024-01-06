---
title: "Retro Gaming with MiSTer"
date: 2020-09-05
---

There are many ways to enjoy classic console and computer video games. For most, that is done with software emulation, or in some casesl vintage hardware. A somewhat recent trend is the use of FPGA to build a kind of hardware implementation of those classic systems. If it isn't obvious from the title, this post is about the [MiSTer](https://github.com/MiSTer-devel/Main_MiSTer/wiki) project.

So, what is MiSTer? It's an open source FPGA implementation of several classic computer, console, and arcade systems. It's built around a commercially available FPGA development board, which open source hardware addons for things like analog controllers, USB, audio, etc.

I recently put together a MiSTer system, and found myself enjoying several games for classic consoles like SNES, and TurboGrafx-16. And, in proper retro gaming fashion, I had to play them on a CRT, for that old school scanline look. There are several ways to go about building a MiSTer, depending on your desires. I wasn't interested in using original controllers, nor did I need digital audio output. So, here's what I selected for mine:

* Terasic DE10-Nano (the core component)
* 128MB SDRAM
* USB Hub
* HDMI to VGA with Audio
* Fan Plate with PCB bottom plate
* Retro-Bit Saturn Controller (USB)
* Samsung 64GB microSD Card

The above components were purchased from several vendors, including [MiSTer Addons](https://misteraddons.com/), [Gator Cable](https://gatorcable.com/), [Best Buy](https://www.bestbuy.com/), and [Amazon](https://www.amazon.com/).

On the display and audio front, I went somewhat old school. Purchased a used Dell P991 19" CRT off Craigslist. It's a beautiful display, after all it's just a rebranded Sony Trinitron. And, for audio I'm a headphones kind of guy, so I used my trusty Audio Technica ATH-M50, along with a FX-Audio PH-A1 headphone amplifier that I purchased from [Parts Express](https://www.partsexpress.com/).

During the build, I learned a few lessons. Not all HDMI to VGA adapters are created equal. I purchased several models from different vendors, many of which either didn't work, or worked intermittently. I suspect due to the high demand from people working at home, that quality control on display adapters has dropped. That said, the Gator Cable adapter works great, although it doesn't support MiSTer's optional Direct Video mode. Controller wise, I initially used an older Logitech gamepad I had, but found it didn't quite have the feel I wanted. So, after reading reviews I purchased the Retro-Bit, which works great for platform type games.

So, what's next for me? I haven't spent any time using the classic computer cores. I'd like to fire up the Apple II core, for some classics like the original Oregon Trail. As well as check out the Amiga, which was a system I've never used, but still has quite the cult following.
