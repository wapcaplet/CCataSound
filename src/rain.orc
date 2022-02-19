
                instr           Raining         ; Water from the sky
iAmp            =               p4              ; Amplitude (TODO: Expand to this amp at the end)
iFreq           =               p5              ; Drip pitch frequency (Hz)
iFreqRes1       =               iFreq*1.33      ; Drip resonances, related to base frequency
iFreqRes2       =               iFreq*1.67
iDamp           =               2.0             ; Damping 2.0 gives infinite dripping
iMaxShake       =               0               ; Feedback (0-1)
iDettack        =               0.01            ; (apparently ignored, or has negligible effect)
iNum            random          5, 10           ; Randomize drip intensity (number of "beads")
                                                ; Create the drip sound with a fixed small amplitude
                                                ; (much higher leads to too much clipping)
aRattle         bamboo          0.1, iDettack, 50, 0.05, 0, iFreq ;, iFreq, iF1, iF2
aJingle         tambourine      0.1, iDettack, 30, 0.75, 0, iFreq ;, iFreq, iF1, iF2
aNoise          unirand         iAmp*0.1        ; a little white noise never hurt anyone
aSig            =               aRattle + aJingle + aNoise

kPan            rspline         0, 1, 0.1, 0.2  ; Slow random panning (kind of cheesy sounding)
aL, aR          pan2            aSig, kPan
                outs            aL, aR          ; Send drips to output
                endin

