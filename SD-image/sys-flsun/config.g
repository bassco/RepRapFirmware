; Configuration file for dc42 Kossel

; Communication and general
M111 S0                             ; Debug off
M550 PFLSUN		        		; Machine name (can be anything you like)
M551 Preprap                        ; Machine password (used for FTP)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0x42 ; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
M552 P192.168.1.50	; IP address (0 = use DHCP)
M554 P192.168.1.1                   ; Gateway
M553 P255.255.255.0                 ; Netmask
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1                   ; Set auxiliary serial port baud rate and require checksum (for PanelDue)

; Axis and motor configuration
M569 P0 S1							; Drive 0 goes forwards
M569 P1 S1							; Drive 1 goes forwards
M569 P2 S1							; Drive 2 goes forwards
M569 P3 S1							; Drive 3 goes backwards
M569 P4 S0							; Drive 4 goes backwards
M574 X2 Y2 Z2 S1					; set endstop configuration (all endstops at high end, active high)

M665 L220.14 R107.10 H280.82 B75 X-0.56 Y-0.33	Z0; set diagonal rod length, delta radius, homed height, printable radius and XY tower corrections
M666 X0.93 Y-0.72 Z-0.21			; put your endstop adjustments here, or use auto calibration to find them
;;M92 X160 Y160 Z160					; Set axis steps/mm (20 tooth pulleys, 0.9deg/step motors)
M92 X100 Y100 Z100					; Set axis steps/mm (16 tooth pulleys, 1.8deg/step motors)
M906 X1000 Y1000 Z1000 E800			; Set motor currents (mA)
M201 X3000 Y3000 Z3000 E1000		; Accelerations (mm/s^2)
M203 X9000 Y9000 Z9000 E3600		; Maximum speeds (mm/min)
M566 X600 Y600 Z600 E600			; Maximum instant speed changes
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; Thermistors and heaters
;M305 P0 T100000 B3950 R4700 H0 L0	; Typical Chinese bed thermistor. Put your own H and/or L values here to set the bed thermistor ADC correction.
M305 P1 T100000 B4388 R4700 H0 L0	; E3Dv6 hot end. Put your own H and/or L values here if necessary to set the first nozzle thermistor ADC correction.
M301 H0 P20 I0.5 D1000 T0.85 W150 B5 ; PID settings for the bed
;; M301 H1 P10 I0.20 D50 T0.50		; PID settings for extruder 0
;; M301 H1 P8.0 I0.04 D49.0 T0.5 B20 W127 S0.8
M307 H1 A496.7 C194.7 D8.7 B0 S0.8 ; Auto-Tune E3DV6 HE
M570 S200							; Allow extra heating time

; Tool definitions
M563 P0 D0 H1                       ; Define tool 0
G10 P0 S0 R0                        ; Set tool 0 operating and standby temperatures
M92 E405                            ; Set extruder steps per mm for first and second extruders

; Z probe and compensation definition
M558 P1 X0 Y0 Z0 H3 F300 T8000		; Z probe is IR and is not used for homing any axes, Z probe dive height 3mm, probing speed 300mm/min, travel speed 12000mm/min
G31 X0 Y0 Z2.55 P500				; Set the zprobe offset and threshold (put your own values here). For a delta, use zero X and Y offset.

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                   ; Axis compensation here

M207 S7.0 F3600 Z0.1				; Set firmware retraction details
M572 D0 S0.1						; set pressure advance

T0									; select first print head
