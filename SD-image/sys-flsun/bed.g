; Auto calibration routine for large delta printer with IR probe

M561						; clear any bed transform, otherwise homing may be at the wrong height

; Probe the bed and do auto calibration
; Probe the bed and do 6- or 7-factor auto calibration

; Adjust the H parameters in the following commands if neeeded to correct for probe height errors caused by effector tilt etc.
; http://escher3d.com/pages/wizards/wizardbed.php
; bed.g file for RepRapFirmware, generated by Escher3D calculator
; 10 points, 6 factors, probing radius: 70, probe offset (0, 0)
G28
G30 P0 X0.00 Y70.00 Z-99999 H0
G30 P1 X60.62 Y35.00 Z-99999 H0
G30 P2 X60.62 Y-35.00 Z-99999 H0
G30 P3 X0.00 Y-70.00 Z-99999 H0
G30 P4 X-60.62 Y-35.00 Z-99999 H0
G30 P5 X-60.62 Y35.00 Z-99999 H0
G30 P6 X0.00 Y35.00 Z-99999 H0
G30 P7 X30.31 Y17.50 Z-99999 H0
G30 P8 X30.31 Y-17.50 Z-99999 H0
G30 P9 X0.00 Y-35.00 Z-99999 H0
G30 P10 X-30.31 Y-17.50 Z-99999 H0
G30 P11 X-30.31 Y17.50 Z-99999 H0
G30 P12 X0 Y0 Z-99999 S7

G1 X0 Y0 Z125 F15000		; get the head out of the way of the bed
