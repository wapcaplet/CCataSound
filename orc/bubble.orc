; Bubbles

                instr           Bubble          ; Bubble sound based on Andy Farnell, "Designing Sound" chapter 35
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3                              ; Duration - not used
iAmp            =               p4                              ; Overall amplitude
iSize           =               p5                              ; Size of bubble, from 0.0 to 2.0 or so
iDecay          =               90 * iSize*.001                 ; Decay time in ms, higher for larger bubbles
kEnvFreq        =               k(1) - expon(1, iDecay, 0.001)  ; Frequency follows an inverse exponential decay
iPitchAdd       =               100 + 300 * (1 - iSize)         ; Smaller bubbles make higher-pitched sounds
aTone           poscil          iAmp, kEnvFreq * 2000 + iPitchAdd
aEnvAmp         expon           1, iDecay, 0.0001               ; Amplitude envelope with low-pass filter removes the
aEnvAmp         butterlp        aEnvAmp, 12                     ; initial spike and gives the waveform a droplet shape
aSig            =               aTone * aEnvAmp
                outs            aSig, aSig
                endin

