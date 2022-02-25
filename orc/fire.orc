; Fire sounds

; Based on Andy Farnell's Pd examples from "Designing Sound"

                opcode          Lapping, a, a   ; Turn a noise stream into a flame-lapping sound
;----------------------------------------------------------------------------------------------------------------------;
aNoise          xin                             ; Take noise from input source
aBand           butterbp        aNoise, 30, 5   ; 30 hz bandpass
aHipass         butterhp        aBand*100, 25   ; 25 hz high-pass (attenuate ultra low frequencies)
aClipped        clip            aHipass, 0, 0.9
aFinal          butterhp        aClipped, 25    ; 25 hz high-pass again to soften clipping(?)
                xout            aFinal*0.6      ; Scale output
                endop


                opcode          Hissing, a, a   ; Turn a noise stream into a sputtering hissing sound
;----------------------------------------------------------------------------------------------------------------------;
aNoise          xin                             ; Take noise from input source
aHiss           butterhp        aNoise, 1000    ; Steady high-pitched hissing
aWobble         butterlp        aNoise, 1       ; Slow wobble from low-frequency noise
                                                ; Magnify effect of sputtering (same formula as Farnell)
aSputter        =               600 * (aWobble*10)^4
aFinal          =               aHiss*aSputter  ; Hiss, but in a sputtering way
                xout            aFinal
                endop


                opcode          Crack, a, a     ; Turn a noise stream into a single crack/pop sound
;----------------------------------------------------------------------------------------------------------------------;
aNoise          xin                             ; Take noise from input source
iDurMs          random          1, 30           ; 1-30 ms duration for single crack
                                                ; Bandpass with 2k-15.5k Hz center frequency and wide bandwidth
iFreq           =               1500 + iDurMs * 500
aBand           butterbp        aNoise, iFreq, 1000
                                                ; Exponential envelope for a sharp crack (converting iDurMs to sec)
kEnv            expon           1, iDurMs*0.001, 0.001
aFinal          =               aBand * kEnv
                xout            aFinal
                endop


                opcode          Crackling, a, a ; Turn a noise stream into a crackling sound
;----------------------------------------------------------------------------------------------------------------------;
aNoise          xin                             ; Take noise from input source
kZero           k               0               ; Zero signal to output when no crackles are occurring
aPopper         butterlp        aNoise, 1       ; Use low-passed input noise as a trigger envelope
kPopper         k               aPopper         ; Convert to k-rate
kCrackle        trigger         kPopper, 0, 0   ; Trigger when popper crosses zero in a positive direction

                if( kCrackle == 1 ) then
aFinal          Crack           aNoise          ; Make a crack sound
                else
aFinal          a               kZero           ; Output silence
                endif

                xout            aFinal          ; TODO: Scaling (crackles are quite faint)
                endop


                opcode          Fire, a, ikkk   ; Fire with parameterized lapping, hissing, and crackling intensity
;----------------------------------------------------------------------------------------------------------------------;
iAmp, kLap, kHiss, kCrack       xin             ; Intensity levels, from 0-1

aNoise          noise           iAmp, 0         ; All sounds are generated from the same noise source for coherency
aLapping        Lapping         aNoise*0.5
aHissing        Hissing         aNoise
aCrackling      Crackling       aNoise

aFinal          =               aLapping*kLap + aHissing*kHiss + aCrackling*kCrack
                xout            aFinal
                endop

;----------------------------------------------------------------------------------------------------------------------;
; Instrument demos of opcodes
;----------------------------------------------------------------------------------------------------------------------;

                instr           FireDemo        ; Demo of Fire opcode with parameterized intensity
;----------------------------------------------------------------------------------------------------------------------;
iAmp            =               p4
aSig            Fire            iAmp, 0.2, 0.5, 1.0
                outs            aSig, aSig
                endin


                instr           LappingDemo
;----------------------------------------------------------------------------------------------------------------------;
iAmp            =               p4
aNoise          noise           iAmp, 0
aSig            Lapping         aNoise
                outs            aSig, aSig
                endin


                instr           HissingDemo
;----------------------------------------------------------------------------------------------------------------------;
iAmp            =               p4
aNoise          noise           iAmp, 0
aSig            Hissing         aNoise
                outs            aSig, aSig
                endin


                instr           CracklingDemo
;----------------------------------------------------------------------------------------------------------------------;
iAmp            =               p4
aNoise          noise           iAmp, 0
aSig            Crackling       aNoise
                outs            aSig, aSig
                endin

