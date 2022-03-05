; Test boom sounds
<CsoundSynthesizer>
<CsOptions>
-odac
; Add both orc and cdda to include path
--env:INCDIR+=orc
--env:INCDIR+=cdda
</CsOptions>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
0dbfs  = 1

#include "boom.orc"
#include "resonate.orc"

</CsInstruments>
<CsScore>

b 0
; Quick gunshot demo
i "BangRingDemo" 0 2 1

e

</CsScore>
</CsoundSynthesizer>
