; Partial or component sounds that may be reused for several effects

                instr           Bonk            ; Bonk, as a strike against wood
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3              ; duration determines 30db decay time
iAmp            =               p4              ; FIXME: iAmp not used
                                                ; Same as Clang, except:
                                                ; stiffness lower, ~100
                                                ; iHFloss higher, ~1-5 (up to 10, which is more like a tap)
                                                ; iWid ~10x wider (greater than 0.2 quickly leads to clipping)
                                                ; Lessened strike velocity (these settings are inherently louder)
iHFloss         =               5               ; high-frequency loss; lower is brighter, higher duller
iPos            =               0.837           ; strike position, very sensitive to strike width
iVel            =               5000            ; strike velocity
iWid            =               0.2             ; strike width; lower is sharper/brighter
kScan           =               0.6             ; scanning frequency

aClang          barmodel        2, 2, 100, iHFloss, kScan, iDur, iPos, iVel, iWid
aSig            =               aClang
                outs            aSig, aSig
                endin


                instr           DoorLatch       ; Latching sound, as on a door
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp            =               p4
                                                ; latch click, shaker with 1 bean (500), no extra shakes
aShake          shaker          iAmp, 2000, 500, 0.99, 0
                                                ; TODO: Add a more definite metallic sound
aSig            =               aShake
                outs            aSig, aSig
                endin


                instr           Footstep        ; Single footstep, heel-toe
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp            =               p4
iFreq           random          300, 600        ; Pitch frequency
iBeans          random          5, 20           ; More beans is more scratchy (could be param)
                                                ; Shaker with 1 shake gives a 2-beat scuffing footstep sound
aShake          shaker          iAmp, iFreq, iBeans, 0.99, 1
aSig            =               aShake
                outs            aSig, aSig      ; TODO: Alternate slight pan to left/right with each step
                endin


#include "resonate.orc"

                instr           CreakRising     ; Creak sound, rising in pitch, as when opening a door
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3
iAmp            =               p4
kPitchEnv       expon           0.05, iDur, 0.001
aCreak          mpulse          iAmp, kPitchEnv
aCreakWood      WoodReson       aCreak, 125
aSig            =               aCreakWood
                outs aSig, aSig
                endin


                instr           CreakFalling    ; Creak sound, falling in pitch, as when closing a door
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3
iAmp            =               p4
kPitchEnv       expon           0.001, iDur, 0.05
aCreak          mpulse          iAmp, kPitchEnv
aCreakWood      WoodReson       aCreak, 125
aSig            =               aCreakWood
                outs            aSig, aSig
                endin


                instr           Splat           ; As pulping a wet zombie
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iDur            =               p3
iAmp            =               p4
iDet            =               0.01            ; iDettack, ignored
aPlop           dripwater       0.1, iDet, 100, 2.0, 0, 250, 400, 650
aSplash         cabasa          0.01, iDet, 2, -1, 0.01
                                                ; For continuous sound, dripwater uses 2.0 damping, and
                                                ; cabasa uses 0.01 feedback. dripwater gives the lower-end
                                                ; plop sounds but its high frequencies aren't convincing, so
                                                ; cabasa provides the more watery splattering sounds
kPlopEnv        expseg          iAmp, iDur*.5, 0.1, iAmp*.5, 0.001
kSplashEnv      expseg          0.1, iDur*.3, iAmp*.5, iDur*.1, 0.1, iDur*.6, 0.001
                                                ; Envelopes determine when each sound is emphasized
aSig            =               aPlop * kPlopEnv + aSplash * kSplashEnv
                outs            aSig, aSig
                endin


                instr           Thud            ; Solid, low thump or thud, as when a door comes to
;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
iAmp            =               p4
aPulse          mpulse          iAmp, 0         ; Do a pulse with no repeat
aThudRes        reson           aPulse, 60, 25  ; Give pulse a low resonance like wood
aSig            =               aThudRes
                outs            aSig, aSig
                endin


