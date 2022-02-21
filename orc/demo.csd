<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
0dbfs  = 1

#include "soundbites.orc"
#include "soundscapes.orc"
#include "effects.orc"
#include "rain.orc"
#include "wind.orc"

</CsInstruments>
<CsScore>
i "Dry" 0 60
; wind params   amp   rumb  blow  howl
i "Wind" 0 60   0.5   1.0   1.0   1.0

i "WalkDirt" 0 1 0.5
i "WalkDirt" ^+.5 1 0.5
i "WalkGrass" ^+.5 1 0.5
i "WalkGrass" ^+.5 1 0.5

b 2
i "DoorOpen" 0 0.5 1.0
i "DoorClose" ^+1 0.5 1.0

b 4
i "Whiff" 0 0.15 1.0
i "Whiff" ^+.5 0.2 1.0
i "Whiff" ^+.5 0.25 1.0
i "Whiff" ^+.5 0.3 1.0
i "Bonk" ^+.5 0.2 1.0
i "Bonk" ^+.5 0.4 1.0
i "Bonk" ^+.5 0.6 1.0
i "Bonk" ^+.5 0.8 1.0
i "Clang" ^+.5 0.2 1.0
i "Clang" ^+.5 0.4 1.0
i "Clang" ^+.5 0.6 1.0
i "Clang" ^+.5 0.8 1.0

b 10
i "Raining" 0 10 1 600
e

</CsScore>
</CsoundSynthesizer>
