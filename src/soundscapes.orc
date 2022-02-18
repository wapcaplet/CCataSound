

gamixL, gamixR  init            0               ; Left/rght mixing channels
                                                ; Each instrument appends its sound to these
garevL, garevR  init            0               ; Reverb channels
                                                ; Each instrument appends part of its sound to these
                                                ; The "reverb" instrument outputs them when enabled

                seed            0               ; Initialize random seed to system clock


                instr           Reverb
aL, aR          reverbsc        garevL, garevR, 0.95, 10000
                outs            aL, aR
                clear           garevL, garevR

                outs            gamixL, gamixR  ; Output dry mix as well, then clear it
                clear           gamixL, gamixR
                endin


                instr           Wailing         ; wailing of wind
iamp            =               p4              ; TODO: use this
ipch            =               p5

kfreq           rspline         ipch*0.8, ipch*1.2, 0.3, 0.7
kbw             rspline         20, 100, 0.2, 0.5
awhite          unirand         iamp
apink           pinkish         iamp
anoise          =               apink + awhite
asig            butterbp        anoise, kfreq, kbw
kpan            rspline         0, 1, 0.1, 0.3

aL, aR          pan2            asig, kpan
garevL          =               garevL+(aL*0.5) ; send part to reverb
arevR           =               garevR+(aR*0.5)
gamixL          =               gamixL+aL       ; send full signal to mix
gamixR          =               gamixR+aR
                endin

