; Wind

; This orchestra is designed for wind-like sounds, including:
; - Rumbling or buffeting, low-frequency pulsating of large air masses moving (fractal noise, beta ~2-3+)
; - Breezing or blowing, mid-frequency steadier airflow sounds (butlp, 100-4000)
; - Wailing or howling, a resonant whistling sound from faster-moving wind (butbp or lowres?)
; - Rustling or whispering, to mimic the stirring of leaves or grass (bamboo 4-8k with highpass?)
; - Rattling or clanking, loose wood or metal objects disturbed by stronger winds
; - Billowing, plastic shopping bags floating about
; - Flapping, cloth flags or hung laundry

; The main "Wind" instrument will provide a parameterized way to create wind of indefinite length,
; with varying intensity and amounts of reactive sounds.


                instr           Wind            ; Main wind instrument
;----------------------------------------------------------------------------------------------------------------------;
iAmp            =               p4              ; Total amplitude
iRumbling       =               p5              ; 0-1, amount of low-frequency rumbling or buffeting
iBlowing        =               p6              ; 0-1, amount of mid-frequency breeze or blowing
iHowling        =               p7              ; 0-1, amount of high-frequency wailing or howling

                                                ; Base amplitude, effectively current wind speed
kBaseAmp        rspline         iAmp*.1, iAmp, 0.2, 0.4

                                                ; Scaled, randomized amplitudes for each wind component
kRumbleAmp      rspline         0, kBaseAmp * iRumbling, 0.1, 0.3
kBlowAmp        rspline         0, kBaseAmp * iBlowing, 0.2, 0.4
;kHowlAmp        rspline         0, kBaseAmp * iHowling, 0.2, 0.4
                                                ; TODO: Scale ranges for more rapid change at higher intensity

                                                ; Rumbling comes from high beta value in fractal noise
kRumbleBeta     rspline         iRumbling * 1.8, iRumbling * 3.0, 0.1, 0.5
aRumbleNoise    fractalnoise    kRumbleAmp, kRumbleBeta
aRumble         butterlp        aRumbleNoise, 1000
aRumble         =               aRumble * 0.05  ; downscale (output is way too loud)

                                                ; Breezy blowing is pink noise with a varying lowpass filter
aBlowNoise      pinkish         kBlowAmp
kBlowPitch      rspline         100, 4000, 0.1, 0.2
aBlow           butterlp        aBlowNoise, kBlowPitch

                                                ; Howling is pink noise through a bandpass filter
aHowlNoise      unirand         iHowling        ; Use howling level directly (unscaled by base amp)
aHowlNoise      butterhp        aHowlNoise, 300 ; Cut out low end of noise
kHowlPitch      rspline         400, 800, 0.3, 0.7
kHowlBandwidth  rspline         10, 100, 0.2, 0.5
aHowl           butterbp        aHowlNoise, kHowlPitch, kHowlBandwidth

aSig            =               aRumble + aBlow + aHowl
                outs            aSig, aSig
                endin

