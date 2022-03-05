; Air movement sounds - swishes, puffs, whiffs, and whooshes

                instr           Swish           ; Subtle swish of air, as when opening or closing a door
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3
iAmp            =               p4
aSwish          pinkish         iAmp/2          ; pink noise with a lowpass filter and triangle envelope
aSwish          lowpass2        aSwish, 200, 1
aSwishEnv       linseg          0, iDur/2, 1, iDur/2, 0
aSig            =               aSwish * aSwishEnv
                outs            aSig, aSig
                endin


                instr           Whiff           ; Sharp slice through the air, as with a weapon
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3
iAmp            =               p4
aNoise          noise           1, 0
kFreqEnv        line            200, iDur, 1000                 ; Sweep frequency bandpass from low to high
aSweep          butterbp        aNoise, kFreqEnv, 100
aSweep          balance         aSweep, aNoise*.8               ; Re-normalize amplitude somewhat
                                                ; expseg gives the best 'whip' effect here
kAmpEnv         expseg          0.001, iDur*.8, iAmp, iDur*0.2, 0.001
aSig            =               aSweep * kAmpEnv
                outs            aSig, aSig
                endin

