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
#include "soundscapes.orc"
#include "effects.orc"

</CsInstruments>
<CsScore>
i "Reverb" 0 60
i "Wailing" 0 60 8000 500

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
i "Bonk" ^+.5 0.2 8000
i "Bonk" ^+.5 0.4 8000
i "Bonk" ^+.5 0.6 8000
i "Bonk" ^+.5 0.8 8000
i "Clang" ^+.5 0.2 8000
i "Clang" ^+.5 0.4 8000
i "Clang" ^+.5 0.6 8000
i "Clang" ^+.5 0.8 8000
e

</CsScore>
</CsoundSynthesizer>
