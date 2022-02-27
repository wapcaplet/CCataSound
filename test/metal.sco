; Test metal sounds
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

#include "metal.orc"

</CsInstruments>
<CsScore>

b 0
; Ping demo, 5 seconds
i "PingDemo" 0 5 1

b 5
; Clanging demo, 2 seconds
i "Clang" 0 0.2 1.0
i "Clang" ^+.5 0.4 1.0
i "Clang" ^+.5 0.6 1.0
i "Clang" ^+.5 0.8 1.0

e

</CsScore>
</CsoundSynthesizer>
