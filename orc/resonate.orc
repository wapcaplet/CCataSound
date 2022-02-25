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

