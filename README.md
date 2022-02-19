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

The readability of many languages benefits when each inner logical block is indented at the same
level. However, Csound is oriented less toward nested logical flow, and more toward connecting
inputs to outputs via some opcodes; it benefits more from indentation that emphasizes visual
alignment of these operations.

Consider this `Whiff` instrument with plain indentation nesting (like C++ or Python might use):

```
instr Whiff
    iDur = p3 ; duration
    iAmp = p4 ; amplitude

    ; white noise generator
    aNoise unirand iAmp
    ; linear envelope ramping frequency from 200-1000 Hz across the duration
    kFreqEnv line 200, p3, 1000
    ; sweep bandpass filter across the envelope with 100 Hz bandwidth
    aSig reson aNoise, kFreqEnv, 100

    ; output sound in stereo
    outs aSig, aSig
endin
```

Compare with this more idiomatic Csound formatting style, practiced by
Richard Boulanger in the [Csound Book](http://www.csounds.com/chapter1/)
and Iain McCurdy in [Csound Haiku](http://iainmccurdy.org/csoundhaiku.html):

```
                instr           Whiff
iDur            =               p3              ; duration
iAmp            =               p4              ; amplitude

aNoise          unirand         iAmp            ; white noise generator
kFreqEnv        line            200, iDur, 1000 ; linear envelope ramping frequency
                                                ; from 200-1000 Hz across the duration

aSig            reson           aNoise, kFreqEnv, 100
                                                ; sweep a bandpass filter across the envelope
                                                ; with 100 Hz bandwidth
                outs            aSig, aSig      ; output sound in stereo
                endin
```

The latter separates the layout into four columns: output, opcode, input, and comment, and is the
style preferred for Csound files in this repository.

Output(s) always come first, with no indentation. If an opcode has no output, the first column will
be blank, as are the `instr`, `endin`, and `outs` lines above.

Opcodes always go in the second column. This includes `=` and `if` as well as `unirand` and `reson`.

Reading down third column, one can see all the input parameters, both literal values like `200` and
variables like `iDur` and `kFreqEnv`.

Finally, descriptive comments begin in the fourth column, just after the inputs, or on the following
line(s) if the input parameters exceed 16 characters, as they often will.

Style preference notes (subject to change):

- Use four indented "columns" as shown above: output, opcode, input, comments
- Use 16-space tab stops, and tell your editor to use spaces, not tab characters
- Keep descriptive comments in the 4th column, after inputs
- Wrap lines to 120 characters or less (this allows 72 characters for comments)
- Capitalize and CamelCase instrument names, to distinguish them from builtin opcodes
- Use CamelCase for variable names (after the type prefix `i`, `k`, `a`)

Pygments includes [lexers for Csound](https://pygments.org/docs/lexers/#lexers-for-csound-languages)
that could be leveraged to standardize the formatting of all Csound files in this repo, if and when
a uniform style is determined.


## Csound references

- [Csound Web IDE](https://ide.csound.com/)
  and [Demo by Steven Yi](https://www.youtube.com/watch?v=4uhqIf0nshQ)
- [The Csound FLOSS Manual](https://flossmanual.csound.com/)
- [Csound Realtime Examples](http://iainmccurdy.org/csound.html)
- [The Csound Book, Chapter 1](http://www.csounds.com/chapter1/)
- [The Canonical Csound Reference Manual](https://csound.com/docs/manual/indexframes.html)
- [Csound Algorithmic Composition Tutorial by Michael Gogins](https://michaelgogins.tumblr.com/post/45943759685/tutorials-for-csound-and-csoundac)
