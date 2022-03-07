; Door and gate sounds

; CDDA uses the "open_door" and "close_door" sound IDs for variants including windows, curtains, tent flaps,
; sliding doors, wooden or metal doors, and any other terrain that can be opened or closed.

; Since the in-game soundpack uses terrain-specific door and window sounds, they should be defined similarly here,
; with instrument names indicating terrain or furniture they are suitable for, ex. OpenDoorMetal or CloseDoorWood.

#include "metal.orc"


;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
                instr           OpenDoorDefault ; Opening door - latch sound, followed by squeak/swish
iDur            =               p3
iAmp            =               p4
iLatchTime      =               0.2
                schedule        "Latching", 0, iLatchTime, iAmp
                schedule        "Swish", 0, iDur*.5, iAmp
                schedule        "CreakRising", iLatchTime, iDur-iLatchTime, iAmp
                endin


;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
                instr           CloseDoorDefault ; Closing door - squeak/swish followed by latch/thump sound
iDur            =               p3
iAmp            =               p4
iLatchTime      =               0.2
                schedule        "CreakFalling", 0, iDur-iLatchTime, iAmp
                schedule        "Swish", iDur*.3, iDur*.5, iAmp
                schedule        "Latching", iDur-iLatchTime, iLatchTime, iAmp
                endin


;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
                instr           GateOpen        ; Opening gate - unlatch and squeak
iDur            =               p3
iAmp            =               p4
                                                ; FIXME: This door latch isn't good here
                schedule        "DoorLatch", 0, iDur, iAmp
                schedule        "Squeak", 0, iDur, iAmp
                endin


;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
                instr           GateClose       ; Closing gate - squeak and latch
iDur            =               p3
iAmp            =               p4
                schedule        "Squeak", 0, iDur, iAmp
                                                ; FIXME: This door latch isn't good here
                schedule        "DoorLatch", 0.7*iDur, 0.3*iDur, 0.5*iAmp
                schedule        "Clang", 0.8*iDur, 0.2*iDur, 0.5*iAmp
                endin


;----------------------------------------------------------------------------------------------------------------------;
; Demos
;----------------------------------------------------------------------------------------------------------------------;


;---------------+---------------+---------------+---------------+---------------+---------------+----------------------;
                instr           DoorDemo        ; Play all door sounds, pausing 1 s in between
iAmp            =               p4
                schedule        "GateOpen", 0, 1, iAmp
                schedule        "GateClose", 2, 1, iAmp
                schedule        "OpenDoorDefault", 4, 1, iAmp
                schedule        "CloseDoorDefault", 6, 1, iAmp
                endin

