; Metallic sounds

; Pings, clanks, and other sounds resembling resonant metal
; Some effects derived from Farnell's "Designing Sound"


                opcode          Ping, a, iiii   ; Simple two-tone sound with exponential decay
;----------------------------------------------------------------------------------------------------------------------;
iAmp, iDur, iF1, iF2            xin             ; Amplitude, duration, and two resonant frequencies

aTone1          vco2            iAmp*.55, iF1   ; Make two tones
aTone2          vco2            iAmp*.45, iF2
                                                ; Make two envelopes, with faster decay on the second tone
kEnv1           expon           iAmp, iDur, 0.001
kEnv2           expon           iAmp, iDur, 0.0001
                                                ; Mix, clip, and return (TODO: compress/expand?)
aSig            =               aTone1*kEnv1 + aTone2*kEnv2
aClipped        clip            aSig, 0, iAmp
                xout            aClipped
                endop


                opcode          Dink, a, iiiii  ; Three-tone sound with harmonics
;----------------------------------------------------------------------------------------------------------------------;
iAmp, iDur, iF1, iF2, iF3       xin             ; Amplitude, duration, and three resonant frequencies

aTone1          vco2            iAmp*.3, iF1    ; Make three tones to be mixed
aTone2          vco2            iAmp*.3, iF2
aTone3          vco2            iAmp*.3, iF3
                                                ; Mix tones in approximately the same way as Farnell, using product
                                                ; and sum to get sidebands, and mix them with a cosine and highpass
aProduct        =               aTone1 * aTone2 * aTone3
aSum            =               aTone1 + aTone2 + aTone3
aCos            cos             aProduct + aSum
aHip            butterhp        aCos, 1000
                                                ; Pointy, fast-decay envelope (TODO: compress/expand)
kEnv            expon           iAmp, iDur, 0.001
aSig            =               aHip * kEnv
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


                instr           DinkTest
;----------------------------------------------------------------------------------------------------------------------;
aPing           Dink            p4, p3, p5, p6, p7
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


                instr           DinkDemo
;----------------------------------------------------------------------------------------------------------------------;
                schedule        "DinkTest", 0, 0.05, 1, 3345, 2980, 4790
                schedule        "DinkTest", 0.2, 0.10, 1, 3345, 2980, 4790
                schedule        "DinkTest", 0.4, 0.15, 1, 3345, 2980, 4790
                schedule        "DinkTest", 0.6, 0.25, 1, 3345, 2980, 4790

                schedule        "DinkTest", 1, 0.05, 1, 4345, 3570, 5850
                schedule        "DinkTest", 1.2, 0.10, 1, 4345, 3570, 5850
                schedule        "DinkTest", 1.4, 0.15, 1, 4345, 3570, 5850
                schedule        "DinkTest", 1.6, 0.25, 1, 4345, 3570, 5850

                schedule        "DinkTest", 2, 0.05, 1, 1750, 2300, 3150
                schedule        "DinkTest", 2.2, 0.10, 1, 1750, 2300, 3150
                schedule        "DinkTest", 2.4, 0.15, 1, 1750, 2300, 3150
                schedule        "DinkTest", 2.6, 0.25, 1, 1750, 2300, 3150

                schedule        "DinkTest", 3, 0.1, 1, 666, 1334, 2201
                schedule        "DinkTest", 3.2, 0.20, 1, 666, 1334, 2201
                schedule        "DinkTest", 3.4, 0.30, 1, 666, 1334, 2201
                schedule        "DinkTest", 3.6, 0.40, 1, 666, 1334, 2201
                endin


                instr           Clang           ; Clang, as a strike on a metal bar
;----------------------------------------------------------------------------------------------------------------------;
iDur            =               p3              ; duration determines 30db decay time
iAmp            =               p4              ; FIXME: iAmp is not used for barmodel
iHFloss         =               0.1             ; high-frequency loss; lower is brighter, higher duller
iPos            =               0.837           ; strike position, very sensitive to strike width
iVel            =               16000           ; strike velocity
iWid            =               0.02            ; strike width; lower is sharper/brighter
kScan           =               0.6             ; scanning frequency
                                                ; subsonic values give nice modulation,
                                                ; audible range leads to changes in timbre

aClang          barmodel        2, 2, 130, iHFloss, kScan, iDur, iPos, iVel, iWid
aSig            =               aClang
                outs            aSig, aSig
                endin


