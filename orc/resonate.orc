; Resonators

; Opcodes and instruments to color other sounds through resonance and delays


                opcode          Ring, a, aiiiii ; Resonate a signal with four resonant frequencies
;----------------------------------------------------------------------------------------------------------------------;
aSig, iBw, iF1, iF2, iF3, iF4   xin             ; Signal, bandwidth, and 4 frequencies to resonate at
aBand1          butterbp        aSig, iF1, iBw
aBand2          butterbp        aSig, iF2, iBw
aBand3          butterbp        aSig, iF3, iBw
aBand4          butterbp        aSig, iF4, iBw
                                                ; FIXME: Adjust levels and clip?
iScale          =               0.9
aRes            =               aBand1*iScale + aBand2*iScale + aBand3*iScale + aBand4*iScale
                xout            aRes
                endop


                opcode          CombOver, a, aiiii ; Multiple comb filter with four resonant frequencies
;----------------------------------------------------------------------------------------------------------------------;
aSig, iF1, iF2, iF3, iF4        xin
iRvt            =               0.1             ; TODO: Find good value for iRvt
                                                ; Comb filter delay times are reciprocal of frequency
aComb1          comb            aSig, iRvt, 1/iF1
aComb2          comb            aSig, iRvt, 1/iF2
aComb3          comb            aSig, iRvt, 1/iF3
aComb4          comb            aSig, iRvt, 1/iF4
iScale          =               0.5             ; Output scaling
aRes            =               aComb1*iScale + aComb2*iScale + aComb3*iScale + aComb4*iScale
                xout            aRes
                endop


                opcode          WoodReson, a, ai ; Resonate a signal to mimic wood
;----------------------------------------------------------------------------------------------------------------------;
aSig, iFreq     xin
                                                ; Borrow a few overtones from Farnell ch. 32
iF1             =               iFreq
iF2             =               iFreq*1.58
iF3             =               iFreq*2.55
iF4             =               iFreq*3.16

aSigReson       Ring            aSig, 500, iF1, iF2, iF3, iF4
aSigCombed      CombOver        aSigReson, iF1, iF2, iF3, iF4
                xout            aSigCombed
                endop

