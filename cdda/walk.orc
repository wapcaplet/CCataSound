
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

                instr           WalkDemo        ; Play each walk sounds 2 times, pausing 1 s in between
iDur            =               0.5
iAmp            =               p4
                schedule        "WalkDirt", 0, iDur, iAmp
                schedule        "WalkDirt", 0.5, iDur, iAmp

                schedule        "WalkGrass", 2, iDur, iAmp
                schedule        "WalkGrass", 2.5, iDur, iAmp
                endin

