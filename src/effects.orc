; Composite sound effects
#include "soundbites.orc"

; Walking on dirt - dry shuffle
instr WalkDirt
    iDur = p3
    iAmp = p4
    schedule "Footstep", 0, iDur, iAmp
endin

; Walking on grass - soft swish
instr WalkGrass
    iDur = p3
    iAmp = p4
    schedule "Footstep", 0, iDur, iAmp*.5
    ; swish with a simple attack/decay envelope
    aswish pinkish iAmp
    aenv linseg 0, 0.1, 1, 0.2, 0
    asig = aswish*aenv

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

