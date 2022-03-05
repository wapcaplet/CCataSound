; Test fire sounds
<CsoundSynthesizer>
<CsOptions>
-odac
--env:INCDIR+=orc
</CsOptions>
; ==============================================
<CsInstruments>
sr     = 44100
ksmps  = 10
nchnls = 2
0dbfs  = 1

#include "fire.orc"

</CsInstruments>
; ==============================================
<CsScore>

b 0

; Components of fire
i "LappingDemo"    0    5  1
i "HissingDemo"    ^+5  5  1
i "CracklingDemo"  ^+5  5  1

b 15
; Full fire demo, 10 seconds
i "FireDemo"       0    10 1



</CsScore>
</CsoundSynthesizer>

