; Partial or component sounds that may be reused for several effects

; Latching sound, as on a door
instr DoorLatch
    iAmp = p4
    ; latch click, shaker with 1 bean (500), no extra shakes
    aShake shaker iAmp, 2000, 500, 0.99, 0
    aSig = aShake
    outs aSig, aSig
endin

; Subtle swish of air, as when opening or closing a door
instr Swish
    iDur = p3
    iAmp = p4
    ; pink noise with a lowpass filter and triangle envelope
    aSwish pinkish iAmp/2
    aSwish lowpass2 aSwish, 200, 1
    aSwishEnv linseg 0, iDur/2, 1, iDur/2, 0
    aSig = aSwish * aSwishEnv
    outs aSig, aSig
endin

; Creak sound, rising in pitch, as when opening a door
instr CreakRising
    iDur = p3
    iAmp = p4
    kPitchEnv expon 0.05, iDur, 0.001
    aCreak mpulse iAmp, kPitchEnv
    aSig = aCreak
    outs aSig, aSig
endin

; Creak sound, falling in pitch, as when closing a door
instr CreakFalling
    iDur = p3
    iAmp = p4
    kPitchEnv expon 0.001, iDur, 0.05
    aCreak mpulse iAmp, kPitchEnv
    aSig = aCreak
    outs aSig, aSig
endin

; Solid, low thump or thud, as when a door comes to
instr Thud
    iAmp = p4
    ; Do a pulse with no repeat
    aPulse mpulse iAmp, 0
    ; Give pulse a low resonance like wood
    aThudRes reson aPulse, 60, 25
    aSig = aThudRes
    outs aSig, aSig
endin

; Swishing through the air, as with a weapon
instr Whiff
    iamp = p4

    aNoise unirand 100
    ; Sweep frequency bandpass from low to high
    kFreqEnv line 200, p3, 1000
    aSweep reson aNoise, kFreqEnv, 100

    ;kAmpEnv cosseg 0, p3*.9, 0.9, 0, 0.9, p3*.1, 0
    ;kAmpEnv linseg 0, p3*.9, 1, p3*.1, 0
    ; expseg gives the best 'whip' effect here
    kAmpEnv expseg 0.001, p3*.8, 0.901, p3*0.2, 0.001

    asig = aSweep*kAmpEnv
    outs asig, asig
endin

; Hitting a solid object like wood, making a sharp rapping sound
instr Whack
    iamp = p4

    ; TODO
endin

