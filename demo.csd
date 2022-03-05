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

#include "soundbites.orc"
#include "soundscapes.orc"
#include "fire.orc"
#include "rain.orc"
#include "wind.orc"

; From cdda
#include "door.orc"
#include "walk.orc"

</CsInstruments>
<CsScore>
b 0

; Walk demo, about 4s long
i "WalkDemo" 0 10 1

b 5
; Door demo, about 8s long
i "DoorDemo" 0 10 1

b 15
; Wind demo, about 15s long
; Dry filter, no reverb
i "Dry" 0 60
; wind params   amp   rumb  blow  howl
i "Wind" 0 15   0.5   1.0   1.0   1.0

b 20
; Various soundbites played during wind
i "Whiff" 0 0.15 1.0
i "Whiff" ^+.5 0.2 1.0
i "Whiff" ^+.5 0.25 1.0
i "Whiff" ^+.5 0.3 1.0
i "Bonk" ^+.5 0.2 1.0
i "Bonk" ^+.5 0.4 1.0
i "Bonk" ^+.5 0.6 1.0
i "Bonk" ^+.5 0.8 1.0

b 30
; Rain demo, 10 seconds
i "Raining" 0 10 1 600

e

</CsScore>
</CsoundSynthesizer>
