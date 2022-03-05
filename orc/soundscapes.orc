
gamixL, gamixR  init            0               ; Left/rght mixing channels
                                                ; Each instrument appends its sound to these
garevL, garevR  init            0               ; Reverb channels
                                                ; Each instrument appends part of its sound to these
                                                ; The "reverb" instrument outputs them when enabled

                seed            0               ; Initialize random seed to system clock


                instr           Reverb
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
aL, aR          reverbsc        garevL, garevR, 0.95, 10000
                outs            aL, aR
                clear           garevL, garevR

                outs            gamixL, gamixR  ; Output dry mix as well, then clear it
                clear           gamixL, gamixR
                endin


                instr           Dry             ; Outputs only dry mix (no reverb)
                outs            gamixL, gamixR
                clear           gamixL, gamixR
                endin

