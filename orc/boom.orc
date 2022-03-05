; Big bangs and bada-booms

                opcode          Chirp, a, iii   ; Simple frequency sweep
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp, iDur, iStartFreq          xin
                                                ; High start frequencies (10 kHz +) with short duration (0.01-0.05 ms)
                                                ; give a sharp bang-like pulse, while any longer durations (100 ms +)
                                                ; yield a distinct phaser-sweep "pew" sound.
kFreq           expon           iStartFreq, iDur, 0.01
aSig            vco2            iAmp, kFreq
aSig            clip            aSig, 0, iAmp
                xout            aSig
                endop


                opcode          Bang, a, ii     ; Burst of noise with fast exponential decay
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp, iDur      xin
                                                ; Duration < 100 ms yields a percussive tap
                                                ; From 100 - 500 ms makes a sharp snare-like sound
aNoise          noise           iAmp, 0
kBangEnv        expon           1, iDur, 0.0000001
aSig            =               aNoise * kBangEnv
aSig            clip            aSig, 0, iAmp
                xout            aSig
                endop


                opcode          Muzzle, a, ii   ; Low-frequency Chirp with an exponential decay envelope
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp, iDur      xin
aThump          Chirp           iAmp, iDur, 150
kEnv            expon           1, iDur, 0.01
aSig            =               aThump * kEnv
                xout            aSig
                endop


;----------------------------------------------------------------------------------------------------------------------;
; Instrument demos of opcodes
;----------------------------------------------------------------------------------------------------------------------;

#include "resonate.orc"

                instr           BangRing
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp            =               p4
iBandwidth      =               p5
aChirp          Chirp           iAmp, 0.06, 10000
aMuzzle         Muzzle          iAmp, 0.04
aBang           Bang            iAmp, 0.25      ; Bang with frequencies to simulate gun body resonances

                                                ; Add resonance to the muzzle and bang
aMuzzleRes      Ring            aMuzzle, iBandwidth, p6, p7, p8, p9
aBangRes        Ring            aBang, iBandwidth, p6, p7, p8, p9

                                                ; Mix all sounds and clip to avoid samples out of range
aSig            =               aChirp + aMuzzleRes + aBangRes
aSig            clip            aSig, 0, iAmp
                outs            aSig, aSig
                endin


                instr           BangRingDemo
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp            =               p4
                schedule        "BangRing", 0.1, 0.1, 1, 1000, 647, 1320, 2243, 2615
                schedule        "BangRing", 0.2, 0.1, 1, 1000, 647, 1320, 2243, 2615
                schedule        "BangRing", 0.3, 0.1, 1, 1000, 647, 1320, 2243, 2615
                schedule        "BangRing", 0.4, 0.1, 1, 1000, 647, 1320, 2243, 2615
                schedule        "BangRing", 0.5, 0.1, 1, 1000, 647, 1320, 2243, 2615

                schedule        "BangRing", 1.1, 0.1, 1, 500, 344, 509, 1040, 1780
                schedule        "BangRing", 1.2, 0.1, 1, 500, 344, 509, 1040, 1780
                schedule        "BangRing", 1.3, 0.1, 1, 500, 344, 509, 1040, 1780
                schedule        "BangRing", 1.4, 0.1, 1, 500, 344, 509, 1040, 1780
                schedule        "BangRing", 1.5, 0.1, 1, 500, 344, 509, 1040, 1780
                endin

