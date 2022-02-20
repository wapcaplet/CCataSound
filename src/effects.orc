; Composite sound effects
#include "soundbites.orc"

                instr           WalkDirt        ; Walking on dirt - dry shuffle
iDur            =               p3
iAmp            =               p4
                schedule        "Footstep", 0, iDur, iAmp
                endin


                instr           WalkGrass       ; Walking on grass - soft swish
iDur            =               p3
iAmp            =               p4
                schedule        "Footstep", 0, iDur, iAmp*.5
aswish          pinkish         iAmp            ; swish with a simple attack/decay envelope
aenv            linseg          0, 0.1, 1, 0.2, 0
asig            =               aswish*aenv
                outs            asig, asig
                endin


                instr           DoorOpen        ; Opening door - latch sound, followed by squeak/swish
iDur            =               p3
iAmp            =               p4
                schedule        "DoorLatch", 0, iDur, iAmp
                schedule        "Swish", 0, iDur*.5, iAmp
                schedule        "CreakRising", 0, iDur, iAmp
                endin


                instr           DoorClose       ; Closing door - squeak/swish followed by latch/thump sound
iDur            =               p3
iAmp            =               p4
                schedule        "CreakFalling", 0, iDur, iAmp
                schedule        "Swish", iDur*.3, iDur*.5, iAmp
                schedule        "DoorLatch", iDur*.7, iDur, iAmp*.5
                schedule        "Thud", iDur*.8, iDur, iAmp*.5
                endin

