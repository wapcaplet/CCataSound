; Test bubble sounds
<CsoundSynthesizer>
<CsOptions>
-odac
--env:INCDIR+=orc
</CsOptions>
; ----------------------------------------------
<CsInstruments>
sr     = 44100
ksmps  = 10
nchnls = 2
0dbfs  = 1

#include "bubble.orc"

</CsInstruments>
; ----------------------------------------------
<CsScore>
b 0
i "Bubble" ^+0.2 1 1 0.2
i "Bubble" ^+0.2 1 1 0.2
i "Bubble" ^+0.2 1 1 0.2
i "Bubble" ^+0.2 1 1 0.2

b 3
i "Bubble" ^+0.2 1 1 0.5
i "Bubble" ^+0.2 1 1 0.5
i "Bubble" ^+0.2 1 1 0.5
i "Bubble" ^+0.2 1 1 0.5

b 6
i "Bubble" ^+0.2 1 1 1.0
i "Bubble" ^+0.2 1 1 1.0
i "Bubble" ^+0.2 1 1 1.0
i "Bubble" ^+0.2 1 1 1.0
e

</CsScore>
</CsoundSynthesizer>

