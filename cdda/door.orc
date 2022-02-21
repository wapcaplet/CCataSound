
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

