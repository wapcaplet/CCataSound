# CCataSound

The CCataSound project uses the open-source [Csound](https://csound.com) audio synthesis toolkit to
design and generate game sound effects and music for
[Cataclysm: Dark Days Ahead](https://github.com/CleverRaven/Cataclysm-DDA).

Sounds and music in this repository are represented as plaintext Csound files, licensed under the
[Creative Commons Attribution-ShareAlike](https://creativecommons.org/licenses/by-sa/4.0/) license.

This project is in the early development phase. So far only a few sound effects have been created as
a proof of concept.


## Usage

Install [Csound](https://csound.com) for your platform, and run `csound src/demo.csd` for a short
demonstration of existing sound effects, including exciting low-fi renditions of:

- Walking on dirt and grass
- Opening and closing a door
- Whiffing a stick through the air

Or you can skip installing and go to
[wapcaplet's Csound IDE page](https://ide.csound.com/profile/wapcaplet)
to hear the demo in your browser, or experiment with your own Csounds.


## Philosophy

In theory Csound can generate not just approximations of real-world instruments and sounds, but any
sound we can imagine - strange, otherworldly sounds, impossible to make with physical instruments.

In practice synthetic sound effects and music tend to be quite distinct from real-world recorded
sounds and instruments; their artificiality is clear to most listeners. Well-crafted synth sounds
can be convincingly realistic, but even the simplest real-world sounds are rich with harmonic
changes over time, and difficult to model with synthesizers.

Thus the design philosophy of CCataSound is to create sounds that are evocative and believable, if
not entirely accurate or realistic.

Many Cataclysm phenomena - giant insects, electrified zombies, and portal storms - are weird and
fantastic, and CDDA leans into that for gameplay effect. CCataSound should do as well, and take
advantage of the bottomless reservoir of sonic possibility that Csound provides.


## Csound references

- [Csound Web IDE](https://ide.csound.com/)
  and [Demo by Steven Yi](https://www.youtube.com/watch?v=4uhqIf0nshQ)
- [The Csound FLOSS Manual](https://flossmanual.csound.com/)
- [Csound Realtime Examples](http://iainmccurdy.org/csound.html)
- [The Csound Book, Chapter 1](http://www.csounds.com/chapter1/)
- [The Canonical Csound Reference Manual](https://csound.com/docs/manual/indexframes.html)

