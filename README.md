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


## Style and indentation

The readability of many languages benefits each inner logical block is indented at the same level.
However, Csound is oriented less toward nested logical flow, and more toward connecting inputs to
outputs via some opcodes; it benefits more from indentation that emphasizes visual alignment of
these operations.

Compare this `Whiff` instrument with plain indentation nesting (like C++ or Python might use):

```
instr Whiff
    idur = p3
    iamp = p4
    ; white noise
    anoise unirand 100
    ; frequency from 200-1000 Hz across duration
    kfreqenv line 200, p3, 1000
    ; sweep bandpass filter across frequency
    asig reson anoise, kfreqenv, 100
    outs asig, asig
endin
```

Versus a more idiomatic Csound formatting style, practiced by
Richard Boulanger in the [Csound Book](http://www.csounds.com/chapter1/)
and Iain McCurdy in [Csound Haiku](http://iainmccurdy.org/csoundhaiku.html):

```
                instr           Whiff
idur            =               p3
iamp            =               p4
anoise          unirand         100             ; white noise
kfreqenv        line            200, idur, 1000 ; frequency from 200-1000 Hz across duration
                                                ; sweep bandpass filter across frequency
asig            reson           anoise, kfreqenv, 100
                outs            asig, asig
                endin
```

The latter separates the layout into four columns: output, opcode, input, and comment. Opcodes
always go in the second column, so the `instr`/`endin` lines are indented (and have no output).
Reading down the third column you can see all the input parameters.

Here, 16-space tab stops are used, allowing room for most opcodes and variable names.

Pygments includes [lexers for Csound](https://pygments.org/docs/lexers/#lexers-for-csound-languages)
that could be leveraged to standardize the formatting of all Csound files in this repo.


## Csound references

- [Csound Web IDE](https://ide.csound.com/)
  and [Demo by Steven Yi](https://www.youtube.com/watch?v=4uhqIf0nshQ)
- [The Csound FLOSS Manual](https://flossmanual.csound.com/)
- [Csound Realtime Examples](http://iainmccurdy.org/csound.html)
- [The Csound Book, Chapter 1](http://www.csounds.com/chapter1/)
- [The Canonical Csound Reference Manual](https://csound.com/docs/manual/indexframes.html)

