; Metallic sounds

; Pings, clanks, and other sounds resembling resonant metal


                opcode          Ping, a, iiii   ; Simple two-tone sound with exponential decay
;----------------------------------------------------------------------------------------------------------------------;
iAmp, iDur, iFreq1, iFreq2      xin             ; Amplitude, duration, and two resonant frequencies

aTone1          vco2            iAmp*.55, iFreq1    ; Make two tones
aTone2          vco2            iAmp*.45, iFreq2
                                                ; Make two envelopes, with faster decay on the second tone
kEnv1           expon           iAmp, iDur, 0.001
kEnv2           expon           iAmp, iDur, 0.0001
                                                ; Mix, clip, and return (TODO: compress/expand?)
aSig            =               aTone1*kEnv1 + aTone2*kEnv2
aClipped        clip            aSig, 0, iAmp
                xout            aClipped
                endop


;----------------------------------------------------------------------------------------------------------------------;
; Demos and tests of opcodes
;----------------------------------------------------------------------------------------------------------------------;

                instr           PingTest
;----------------------------------------------------------------------------------------------------------------------;
aPing           Ping            p4, p3, p5, p6
                outs            aPing, aPing
                endin


                instr           PingDemo
;----------------------------------------------------------------------------------------------------------------------;
                schedule        "PingTest", 0, 0.05, 1, 10500, 9453
                schedule        "PingTest", 0.2, 0.10, 1, 10500, 9453
                schedule        "PingTest", 0.4, 0.15, 1, 10500, 9453
                schedule        "PingTest", 0.6, 0.25, 1, 10500, 9453

                schedule        "PingTest", 1, 0.05, 1, 5400, 8350
                schedule        "PingTest", 1.2, 0.10, 1, 5400, 8350
                schedule        "PingTest", 1.4, 0.15, 1, 5400, 8350
                schedule        "PingTest", 1.6, 0.25, 1, 5400, 8350

                schedule        "PingTest", 2, 0.05, 1, 3740, 6095
                schedule        "PingTest", 2.2, 0.10, 1, 3740, 6095
                schedule        "PingTest", 2.4, 0.15, 1, 3740, 6095
                schedule        "PingTest", 2.6, 0.25, 1, 3740, 6095

                schedule        "PingTest", 3, 0.05, 1, 1795, 3372
                schedule        "PingTest", 3.2, 0.10, 1, 1795, 3372
                schedule        "PingTest", 3.4, 0.15, 1, 1795, 3372
                schedule        "PingTest", 3.6, 0.25, 1, 1795, 3372
                endin

