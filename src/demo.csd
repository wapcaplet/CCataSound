<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2

#include "soundbites.orc"
#include "effects.orc"

</CsInstruments>
<CsScore>
i "WalkDirt" 0 1 5000
i "WalkDirt" ^+.5 1 5000
i "WalkGrass" ^+.5 1 5000
i "WalkGrass" ^+.5 1 5000

b 2
i "DoorOpen" 0 0.5 8000
i "DoorClose" ^+1 0.5 8000

b 4
i "Whiff" 0 0.15 8000
i "Whiff" ^+.5 0.2 8000
i "Whiff" ^+.5 0.25 8000
i "Whiff" ^+.5 0.3 8000
e

</CsScore>
</CsoundSynthesizer>
