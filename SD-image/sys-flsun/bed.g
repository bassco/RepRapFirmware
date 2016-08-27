; Auto calibration routine for large delta printer with IR probe

M561						; clear any bed transform, otherwise homing may be at the wrong height

; Probe the bed and do auto calibration
; Probe the bed and do 6- or 7-factor auto calibration

; Adjust the H parameters in the following commands if neeeded to correct for probe height errors caused by effector tilt etc.
; http://escher3d.com/pages/wizards/wizardbed.php
; bed.g file for RepRapFirmware, generated by Escher3D calculator
; 10 points, 6 factors, probing radius: 50, probe offset (0, 0)
; 45mm radius and X10mm offset
G28
G1 X0 Y45.00 Z10 F4000		; go to just above the first probe point to speed up probing
G30 P0 X0.00 Y45.00 Z-99999 H0
G30 P1 X38.97 Y22.50 Z-99999 H0
G30 P2 X38.97 Y-22.50 Z-99999 H0
G30 P3 X0.00 Y-45.00 Z-99999 H0
G30 P4 X-38.97 Y-22.50 Z-99999 H0
G30 P5 X-38.97 Y22.50 Z-99999 H0
G30 P6 X0.00 Y22.50 Z-99999 H0
G30 P7 X19.49 Y-11.25 Z-99999 H0
G30 P8 X-19.49 Y-11.25 Z-99999 H0
G30 P9 X0 Y0 Z-99999 S6

G1 X0 Y0 Z150 F15000		; get the head out of the way of the bed
