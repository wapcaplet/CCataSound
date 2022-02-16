; Composite sound effects
#include "soundbites.orc"

; Walking on dirt - dry shuffle
instr WalkDirt
    iamp = p4
    ; shaker with 1 shake gives a 2-beat footstep-like sound
    ashak shaker iamp, 100, 8, 0.99, 1
    ; sandpaper gives initial step more scuff
    asand sandpaper iamp/20, 0.01, 500, 0
    asig = ashak + asand

    outs asig, asig
endin

; Walking on grass - soft swish
instr WalkGrass
    iamp = p4
    ; softer step
    ashak shaker iamp*.5, 100, 8, 0.99, 1
    ; swish with a simple attack/decay envelope
    aswish pinkish iamp
    aenv linseg 0, 0.1, 1, 0.2, 0
    asig = ashak + aswish*aenv

    outs asig, asig
endin

; Opening door - latch sound, followed by squeak/swish
instr DoorOpen
    iDur = p3
    iAmp = p4
    schedule "DoorLatch", 0, iDur, iAmp
    schedule "Swish", 0, iDur*.5, iAmp
    schedule "CreakRising", 0, iDur, iAmp
endin

; Closing door - squeak/swish followed by latch/thump sound
instr DoorClose
    iDur = p3
    iAmp = p4
    schedule "CreakFalling", 0, iDur, iAmp
    schedule "Swish", iDur*.3, iDur*.5, iAmp
    schedule "DoorLatch", iDur*.7, iDur, iAmp*.5
    schedule "Thud", iDur*.8, iDur, iAmp*.5
endin

