; GCode for printing a 20mm cube
; Set the temperature of the hotend and heated bed
M104 S220 ; Set hotend temperature to 220C
M140 S60 ; Set heated bed temperature to 60C
M109 S220 ; Wait for hotend to reach target temperature
M190 S60 ; Wait for heated bed to reach target temperature

; Home all axes
G28 ; Home all axes

; Start printing
G21 ; Set units to millimeters
G90 ; Use absolute positioning

; Initial Layer Height
G92 Z0 ; Set current position to zero
G1 Z0.2 F300 ; Move to first layer height
G1 X0 Y0 F1500 ; Move to starting corner

; Printing the perimeters of the bottom layer
G1 X20 Y0 F1000 ; Move to the right 20mm
G1 X20 Y20 F1000 ; Move back 20mm
G1 X0 Y20 F1000 ; Move left 20mm
G1 X0 Y0 F1000 ; Move to starting point

; Fill the bottom layer (simple line fill, might need specific pattern depending on slicer)
G1 X20 Y0 F1000
G1 Y10 ; Move halfway back
G1 X0 ; Move left 20mm
G1 Y0 ; Complete the fill (naive approach, typically done in a better fill pattern)

; Move up layer by layer (assuming layer height of 0.2mm)
G92 Z0.2 ; Set current Z position to 0.2mm after first layer
; Loop for each layer
G1 Z0.4 F300 ; Move to next layer height

; Repeat perimeter and fill for each layer until the top
; You will need more complex pattern handling for actual fills and accurate printing
; Similar blocks would be repeated, increasing Z by 0.2 each time until reaching 20mm
; This loop needs to be implemented either manually or through your slicing software
; Example of a few layers:

G1 X20 Y0 F1000 ; Move to the right 20mm
G1 X20 Y20 F1000 ; Move back 20mm
G1 X0 Y20 F1000 ; Move left 20mm
G1 X0 Y0 F1000 ; Move to starting point

G1 Z0.6 F300 ; Move to next layer height
; Repeat as above...

; Final movement
G1 Z20 F300 ; Finish at top of cube

M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
G28 X0 ; Home X axis
M84 ; Disable motors
