# CCataSound Style Guide

Csound's language syntax is quite flexible, allowing a variety of indentation and nesting styles.
While the literature recommends basic good coding virtues like meaningful variable names, liberal
commenting, and whitespace for readability, and [Csound Coding Tips](https://csound.com/coding.html)
may specifically recommend indenting instrument blocks, the extant Csound examples in the broader
community suggest there is little consensus about indentation, leaving each artist to determine
their own style.

As such, CCataSound has a recommended (if not strictly enforced) code layout and indentation style,
described here.


## Guidelines

- When in doubt, be readable.
- CamelCase variable names (after the `i`, `k`, `a` type prefix), like `aSig` and `kAmpEnv`
- Capitalize and CamelCase instrument names, to distinguish them from builtin opcodes
- Use four indented "columns" as described below: output, opcode, input, comments
- Use 16-space tab stops, and tell your editor to use spaces, not tab characters
- Wrap lines to 120 characters or less (this allows 72 characters for comments)


## Indentation and Tabs

The readability of many languages benefits when each inner logical block is indented at the same
level. In Python, logical-block-based indentation is crucial to both meaning and readability, and
such indentation is strongly recommended even in languages that don't enforce it syntactically.

But unlike general-purpose programming languages, Csound is only rarely oriented toward nested
logical flow with conditions and loops; typically, it's mostly about connecting outputs to inputs
with opcodes. It benefits more from whitespace that emphasizes readability, visual alignment, and
clearer separation of code from documentation.

Consider this `Whiff` instrument with plain scope-based indentation (like C++ or Python might use):

```
; Swishing through the air, as with a weapon
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

Compare with this approach more idiomatic to Csound, inspired by styles practiced by
Richard Boulanger in the [Csound Book](http://www.csounds.com/chapter1/)
and Iain McCurdy in [Csound Haiku](http://iainmccurdy.org/csoundhaiku.html):

```
                instr           Whiff           ; Swishing through the air, as with a weapon
;---------------------------------------------------------------------------------------------;
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

The latter demands a wider text area to prevent wrapping (100-120 characters), but is the preferred
style for Csound orchestras in this repository. There are four columns: output, opcode, input, and
comment:

- First: Output(s), with no indentation. If an opcode has no output, the first column will be blank,
  as are the `instr`, `endin`, and `outs` lines above.

- Second: Opcode, indented 16 characters. This includes `=` as well as `unirand` and `reson`.

- Third: Input(s) to the opcode, indented 32 characters. Includes both literal values like `200` and
  variables like `iDur` or `kFreqEnv`. These will often spill into the fourth column and beyond.

- Fourth: Descriptive comments starting with `;` and indented 48 characters. This keeps the
  majority of the comments and documentation well to the right of the code, improving the flow and
  readability of both (provided one has the screen width to see it all).

N.B., the above indentation style is atrocious for conditional operators like `if`, `else`,
`elseif`, `endif`, especially if they are nested; in those cases, follow rule 1 and use whatever is
most readable.


## Future: Auto-styling?

Pygments includes [lexers for Csound](https://pygments.org/docs/lexers/#lexers-for-csound-languages)
that could be leveraged to standardize the formatting of all Csound files in this repo, if and when
a uniform style is determined.


