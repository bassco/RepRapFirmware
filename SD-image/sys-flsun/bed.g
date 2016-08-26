; Auto calibration routine for large delta printer with IR probe

M561						; clear any bed transform, otherwise homing may be at the wrong height
G28							; home the printer

; Probe the bed and do auto calibration
G1 X-73.6 Y-42.5 Z10 F15000		; go to just above the first probe point to speed up probing
; Probe the bed and do 6- or 7-factor auto calibration

; Adjust the H parameters in the following commands if neeeded to correct for probe height errors caused by effector tilt etc.
G30 P0 X-73.6 Y-42.5 Z-99999 H0   ; X tower
G30 P1 X0 Y-85 Z-99999 H0         ; between X and Y towers
G30 P2 X73.6 Y-42.5 Z-99999 H0    ; Y tower
G30 P3 X73.6 Y20 Z-99999 H0       ; between Y and Z towers
G30 P4 X0 Y67 Z-99999 H0          ; Z tower
G30 P5 X-73.6 Y20 Z-99999 H0      ; between Z and X towers
G30 P6 X-36.8 Y-21.25 Z-99999 H0  ; half way to X tower
G30 P7 X36.8 Y-21.25 Z-99999 H0   ; half way to Y tower
G30 P8 X0 Y42.5 Z-99999 H0        ; half way to Z tower
G30 P9 X0 Y0 Z-99999 H0 S6        ; centre, and auto-calibrate 6 factors

G1 X0 Y0 Z150 F15000		; get the head out of the way of the bed
