; HEADER_BLOCK_START
; BambuStudio 01.08.04.51
; model printing time: 15m 22s; total estimated time: 21m 9s
; total layer number: 100
; model label id: 109
; filament_density: 1.24,1.24
; filament_diameter: 1.75,1.75
; max_z_height: 20.00
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 70,70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = outer_and_inner
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S220\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\n{if (flush_length_2 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\n{if (flush_length_3 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\n{if (flush_length_4 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; close_fan_the_first_x_layers = 1,1
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = brim_type;skirt_loops;wall_loops;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_pressure_advance = 0,0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0
; eng_plate_temp_initial_layer = 0,0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 80,80
; fan_max_speed = 100,100
; fan_min_speed = 50,50
; filament_colour = #00AE42;#FFFF00
; filament_cost = 20,20
; filament_density = 1.24,1.24
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98,0.98
; filament_ids = GFL99;GFL99
; filament_is_support = 0,0
; filament_max_volumetric_speed = 12,12
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_settings_id = "Generic PLA @BBL P1P";"Generic PLA @BBL P1P"
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA
; filament_vendor = Generic;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,615,308,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; head_wrap_detect_zone = 
; host_type = octoprint
; hot_plate_temp = 65,65
; hot_plate_temp_initial_layer = 65,65
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL P1P";;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 20230707 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,240
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; post_process = 
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab P1P 0.4 nozzle"
; print_flow_ratio = 1
; print_host = 
; print_host_webui = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL P1P - Copy
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1P
; printer_settings_id = Bambu Lab P1P 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; printing_by_object_gcode = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_gap = 15%
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 2
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 8,8
; slow_down_min_speed = 20,20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65
; textured_plate_temp_initial_layer = 65,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = 
; timelapse_type = 0
; top_area_threshold = 100%
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_brim_width = 0
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 4
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 241
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R21
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 20230707 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S65 ;set bed temp
M190 S65 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
M73 P20 R16
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P21 R16
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P22 R16
G1 E-0.5 F300

M73 P23 R16
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
M73 P24 R16
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X21.7408 Y22.6934 I35.627 J35.627
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
M73 P24 R15
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F4800
G0 Y11 E0.700 F1200
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F4800
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
G21
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
G1 X24.453 Y22.902 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Skirt
; LINE_WIDTH: 0.5
G1 F3000
M73 P25 R15
G1 X25.899 Y21.867 E.06623
G1 X27.166 Y21.32 E.05138
G1 X28.76 Y20.968 E.06082
G1 X49.77 Y20.93 E.78253
G1 X50.869 Y21.043 E.04118
G1 X52.024 Y21.351 E.04449
G1 X53.34 Y21.954 E.05392
G1 X54.355 Y22.647 E.04578
G1 X55.592 Y23.925 E.06623
G1 X56.195 Y24.852 E.04118
G1 X56.741 Y26.118 E.05138
G1 X57.034 Y27.293 E.04509
G1 X57.139 Y28.507 E.04539
G1 X57.131 Y48.722 E.75295
G1 X57.018 Y49.822 E.04118
G1 X56.71 Y50.976 E.04449
M73 P26 R15
G1 X56.337 Y51.856 E.0356
G1 X55.69 Y52.942 E.04709
G1 X54.655 Y54.112 E.05816
G1 X53.21 Y55.147 E.06623
G1 X51.414 Y55.852 E.07186
G1 X49.747 Y56.085 E.0627
G1 X29.339 Y56.084 E.76011
G1 X28.239 Y55.97 E.04118
G1 X27.085 Y55.662 E.04449
G1 X26.205 Y55.29 E.0356
G1 X25.119 Y54.643 E.04709
G1 X23.95 Y53.608 E.05816
G1 X22.914 Y52.162 E.06623
G1 X22.209 Y50.366 E.07186
G1 X21.976 Y48.699 E.0627
G1 X21.977 Y28.291 E.76011
G1 X22.091 Y27.192 E.04118
G1 X22.399 Y26.038 E.04449
G1 X22.771 Y25.158 E.0356
G1 X23.418 Y24.071 E.04709
G1 X24.414 Y22.947 E.05592
G1 X24.746 Y23.253 F30000
G1 F3000
G1 X26.137 Y22.257 E.06372
M73 P27 R15
G1 X27.334 Y21.745 E.04848
G1 X28.79 Y21.424 E.05555
G1 X49.736 Y21.386 E.78015
G1 X50.769 Y21.489 E.03867
G1 X51.845 Y21.772 E.04146
G1 X53.093 Y22.339 E.05104
G1 X54.051 Y22.989 E.04311
G1 X55.241 Y24.217 E.06372
G1 X55.804 Y25.089 E.03867
G1 X56.316 Y26.286 E.04848
G1 X56.588 Y27.389 E.04229
G1 X56.682 Y28.507 E.04179
G1 X56.675 Y48.688 E.75169
G1 X56.572 Y49.721 E.03867
G1 X56.289 Y50.798 E.04146
G1 X55.916 Y51.678 E.0356
G1 X55.306 Y52.696 E.04421
G1 X54.362 Y53.761 E.05298
G1 X52.972 Y54.757 E.06372
G1 X51.32 Y55.405 E.06607
G1 X49.716 Y55.629 E.06032
G1 X29.373 Y55.628 E.75773
G1 X28.34 Y55.525 E.03867
G1 X27.263 Y55.242 E.04146
G1 X26.383 Y54.869 E.0356
G1 X25.365 Y54.258 E.04421
G1 X24.3 Y53.315 E.05298
G1 X23.304 Y51.924 E.06372
G1 X22.656 Y50.273 E.06607
G1 X22.432 Y48.669 E.06032
G1 X22.433 Y28.325 E.75773
G1 X22.537 Y27.292 E.03867
G1 X22.82 Y26.216 E.04146
G1 X23.192 Y25.336 E.0356
G1 X23.803 Y24.318 E.04421
G1 X24.706 Y23.298 E.05075
; WIPE_START
G1 F24000
G1 X26.137 Y22.257 E-.67232
G1 X26.349 Y22.166 E-.08768
; WIPE_END
G1 E-.04 F1800
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G1 X26.48 Y25.304 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
G1 X26.973 Y24.893 E.0239
G1 X27.519 Y24.56 E.0238
G1 X28.304 Y24.249 E.03148
G1 X28.984 Y24.103 E.02589
G1 X29.562 Y24.065 E.02157
G1 X49.546 Y24.065 E.74433
G1 X50.194 Y24.113 E.02422
G1 X50.817 Y24.253 E.02377
G1 X51.66 Y24.61 E.03411
G1 X52.279 Y25.007 E.02737
G1 X52.757 Y25.433 E.02386
G1 X53.169 Y25.925 E.0239
G1 X53.501 Y26.471 E.0238
G1 X53.812 Y27.257 E.03148
G1 X53.958 Y27.937 E.02589
G1 X53.997 Y28.514 E.02157
G1 X53.997 Y48.498 E.74433
G1 X53.948 Y49.147 E.02422
G1 X53.808 Y49.769 E.02377
G1 X53.451 Y50.613 E.03411
G1 X53.054 Y51.231 E.02737
G1 X52.628 Y51.71 E.02386
G1 X52.136 Y52.121 E.0239
G1 X51.591 Y52.454 E.02378
G1 X50.752 Y52.78 E.0335
G1 X50.125 Y52.911 E.02386
G1 X49.547 Y52.949 E.02159
G1 X29.563 Y52.949 E.74433
G1 X28.914 Y52.901 E.02422
G1 X28.292 Y52.761 E.02377
G1 X27.448 Y52.403 E.03411
G1 X26.83 Y52.007 E.02737
G1 X26.351 Y51.581 E.02386
G1 X25.94 Y51.088 E.0239
G1 X25.608 Y50.543 E.02378
G1 X25.281 Y49.705 E.0335
G1 X25.15 Y49.078 E.02386
G1 X25.112 Y48.499 E.02159
G1 X25.112 Y28.515 E.74433
G1 X25.16 Y27.867 E.02422
G1 X25.301 Y27.244 E.02377
G1 X25.658 Y26.401 E.03411
G1 X26.054 Y25.782 E.02737
G1 X26.44 Y25.349 E.02163
G1 X26.782 Y25.654 F30000
G1 F3000
G1 X26.807 Y25.627 E.00139
G1 X27.232 Y25.272 E.02062
G1 X27.713 Y24.977 E.02102
G1 X28.427 Y24.692 E.02862
G1 X29.057 Y24.556 E.02403
G1 X29.581 Y24.522 E.01956
G1 X49.534 Y24.522 E.74316
G1 X50.137 Y24.568 E.02251
G1 X50.688 Y24.695 E.02106
G1 X51.435 Y25.011 E.03025
G1 X52.01 Y25.379 E.02541
G1 X52.435 Y25.759 E.02123
G1 X52.789 Y26.185 E.02062
G1 X53.085 Y26.666 E.02102
G1 X53.369 Y27.379 E.02862
G1 X53.505 Y28.01 E.02403
G1 X53.539 Y28.534 E.01956
G1 X53.539 Y48.476 E.74278
G1 X53.496 Y49.069 E.02214
G1 X53.366 Y49.64 E.02181
G1 X53.05 Y50.388 E.03025
G1 X52.682 Y50.962 E.02541
G1 X52.302 Y51.387 E.02123
G1 X51.877 Y51.742 E.02062
G1 X51.376 Y52.047 E.02183
G1 X50.611 Y52.342 E.03055
G1 X50.072 Y52.455 E.02048
G1 X49.527 Y52.492 E.02036
G1 X29.575 Y52.492 E.74316
G1 X28.972 Y52.445 E.02251
G1 X28.421 Y52.319 E.02106
G1 X27.673 Y52.002 E.03025
G1 X27.099 Y51.634 E.02541
G1 X26.674 Y51.254 E.02123
G1 X26.319 Y50.829 E.02062
G1 X26.015 Y50.328 E.02183
G1 X25.719 Y49.563 E.03055
G1 X25.606 Y49.025 E.02048
G1 X25.569 Y48.48 E.02036
G1 X25.569 Y28.527 E.74316
G1 X25.616 Y27.925 E.02251
G1 X25.742 Y27.374 E.02106
G1 X26.059 Y26.626 E.03025
G1 X26.427 Y26.051 E.02541
G1 X26.742 Y25.699 E.0176
G1 X27.083 Y26.004 F30000
G1 F3000
G1 X27.119 Y25.964 E.00202
G1 X27.492 Y25.65 E.01814
G1 X27.93 Y25.382 E.01912
G1 X28.572 Y25.128 E.02572
G1 X29.111 Y25.012 E.02055
G1 X29.592 Y24.979 E.01795
G1 X49.511 Y24.979 E.74192
G1 X50.057 Y25.021 E.0204
G1 X50.557 Y25.136 E.01911
G1 X51.211 Y25.413 E.02643
G1 X51.741 Y25.752 E.02343
G1 X52.111 Y26.086 E.01858
G1 X52.422 Y26.46 E.01814
G1 X52.668 Y26.861 E.01752
G1 X52.926 Y27.502 E.02574
G1 X53.052 Y28.084 E.02214
G1 X53.082 Y28.553 E.01754
G1 X53.082 Y48.455 E.74124
G1 X53.043 Y48.991 E.02004
G1 X52.925 Y49.511 E.01984
G1 X52.648 Y50.163 E.0264
M73 P28 R15
G1 X52.309 Y50.693 E.02343
G1 X51.99 Y51.05 E.01784
G1 X51.618 Y51.363 E.0181
G1 X51.162 Y51.639 E.01987
G1 X50.47 Y51.905 E.02761
G1 X50 Y52.002 E.01785
G1 X49.507 Y52.035 E.01842
G1 X29.597 Y52.035 E.74156
G1 X29.051 Y51.993 E.0204
G1 X28.551 Y51.878 E.01911
G1 X27.898 Y51.601 E.02643
G1 X27.368 Y51.262 E.02343
G1 X27.011 Y50.942 E.01784
G1 X26.698 Y50.57 E.0181
G1 X26.422 Y50.114 E.01987
G1 X26.156 Y49.422 E.02761
G1 X26.059 Y48.953 E.01785
G1 X26.026 Y48.46 E.01842
G1 X26.027 Y28.55 E.74156
G1 X26.068 Y28.004 E.0204
G1 X26.183 Y27.504 E.01911
G1 X26.46 Y26.85 E.02643
G1 X26.799 Y26.321 E.02343
G1 X27.043 Y26.049 E.01359
G1 X27.383 Y26.355 F30000
G1 F3000
G1 X27.445 Y26.286 E.00346
G1 X27.752 Y26.029 E.01491
G1 X28.146 Y25.788 E.01719
G1 X28.716 Y25.565 E.02282
G1 X29.166 Y25.468 E.01713
G1 X29.603 Y25.436 E.01633
G1 X49.489 Y25.436 E.74067
G1 X49.978 Y25.473 E.01827
G1 X50.427 Y25.577 E.01716
G1 X50.986 Y25.814 E.02263
G1 X51.471 Y26.124 E.02143
G1 X51.787 Y26.411 E.0159
G1 X52.044 Y26.72 E.01495
G1 X52.253 Y27.058 E.0148
G1 X52.483 Y27.626 E.02285
G1 X52.599 Y28.157 E.02024
G1 X52.625 Y28.573 E.01551
G1 X52.625 Y48.433 E.73972
G1 X52.588 Y48.934 E.0187
G1 X52.483 Y49.381 E.0171
G1 X52.247 Y49.939 E.02257
G1 X51.937 Y50.424 E.02145
G1 X51.663 Y50.727 E.01521
G1 X51.359 Y50.983 E.01482
G1 X50.948 Y51.232 E.01787
G1 X50.33 Y51.467 E.02464
G1 X49.929 Y51.548 E.01522
G1 X49.487 Y51.578 E.01651
G1 X29.62 Y51.577 E.73997
G1 X29.131 Y51.541 E.01827
G1 X28.682 Y51.437 E.01716
G1 X28.122 Y51.2 E.02263
G1 X27.637 Y50.889 E.02145
G1 X27.334 Y50.616 E.01521
G1 X27.078 Y50.311 E.01482
G1 X26.829 Y49.901 E.01787
G1 X26.594 Y49.282 E.02464
G1 X26.513 Y48.882 E.01522
G1 X26.483 Y48.44 E.01651
G1 X26.484 Y28.572 E.73998
G1 X26.52 Y28.083 E.01827
G1 X26.624 Y27.634 E.01716
G1 X26.861 Y27.075 E.02263
G1 X27.172 Y26.59 E.02145
G1 X27.343 Y26.4 E.00952
G1 X27.682 Y26.706 F30000
G1 F3000
G1 X27.757 Y26.623 E.00415
G1 X28.011 Y26.408 E.01241
G1 X28.361 Y26.195 E.01524
G1 X28.859 Y26.001 E.01992
G1 X29.24 Y25.921 E.0145
G1 X29.614 Y25.894 E.01398
G1 X49.477 Y25.894 E.7398
G1 X49.898 Y25.925 E.01575
G1 X50.296 Y26.018 E.0152
G1 X50.782 Y26.226 E.01971
G1 X51.201 Y26.496 E.01856
G1 X51.463 Y26.735 E.01319
G1 X51.665 Y26.98 E.01184
G1 X51.837 Y27.255 E.0121
G1 X52.041 Y27.751 E.01994
G1 X52.145 Y28.231 E.01831
G1 X52.168 Y28.592 E.01347
G1 X52.168 Y48.411 E.73818
G1 X52.135 Y48.854 E.01654
G1 X52.043 Y49.25 E.01515
G1 X51.835 Y49.735 E.01966
G1 X51.564 Y50.154 E.0186
G1 X51.352 Y50.391 E.01185
G1 X51.1 Y50.604 E.01228
G1 X50.735 Y50.824 E.01586
G1 X50.191 Y51.029 E.02166
G1 X49.859 Y51.095 E.01261
G1 X49.467 Y51.121 E.01463
G1 X29.642 Y51.12 E.73841
G1 X29.21 Y51.088 E.01613
G1 X28.813 Y50.996 E.0152
G1 X28.326 Y50.788 E.01971
G1 X27.907 Y50.517 E.0186
G1 X27.67 Y50.304 E.01185
G1 X27.457 Y50.053 E.01228
G1 X27.237 Y49.688 E.01586
G1 X27.032 Y49.144 E.02166
G1 X26.966 Y48.812 E.01261
G1 X26.94 Y48.42 E.01463
G1 X26.941 Y28.595 E.73841
G1 X26.973 Y28.163 E.01613
G1 X27.065 Y27.765 E.0152
G1 X27.274 Y27.279 E.01971
G1 X27.544 Y26.859 E.0186
G1 X27.642 Y26.75 E.00546
G1 X28.002 Y27.066 F30000
G1 F3000
G1 X28.12 Y26.931 E.00668
G1 X28.488 Y26.656 E.0171
G1 X28.831 Y26.493 E.01414
G1 X29.203 Y26.391 E.01438
G1 X29.589 Y26.35 E.01444
G1 X49.513 Y26.35 E.74211
G1 X49.959 Y26.406 E.01671
G1 X50.428 Y26.556 E.01835
G1 X50.774 Y26.761 E.01499
G1 X51.05 Y26.989 E.01333
G1 X51.186 Y27.129 E.00727
G1 X51.417 Y27.462 E.01511
G1 X51.57 Y27.785 E.01331
G1 X51.67 Y28.154 E.01422
G1 X51.711 Y28.542 E.01452
G1 X51.711 Y48.473 E.74238
G1 X51.644 Y48.966 E.01852
G1 X51.471 Y49.45 E.01914
G1 X51.296 Y49.734 E.01244
G1 X51.071 Y50.004 E.01307
G1 X50.932 Y50.139 E.00722
G1 X50.599 Y50.37 E.0151
G1 X50.276 Y50.522 E.01331
G1 X49.907 Y50.622 E.01422
G1 X49.52 Y50.664 E.01452
G1 X29.588 Y50.664 E.74238
G1 X29.095 Y50.596 E.01852
G1 X28.611 Y50.424 E.01914
G1 X28.327 Y50.248 E.01244
G1 X28.057 Y50.024 E.01307
G1 X27.923 Y49.884 E.00722
G1 X27.691 Y49.551 E.0151
G1 X27.539 Y49.228 E.01332
G1 X27.439 Y48.86 E.01422
G1 X27.397 Y48.472 E.01452
G1 X27.403 Y28.469 E.74504
G1 X27.474 Y28.007 E.0174
G1 X27.604 Y27.632 E.01481
G1 X27.809 Y27.286 E.01495
G1 X27.963 Y27.111 E.00869
G1 X28.309 Y27.398 F30000
G1 F3000
G1 X28.393 Y27.297 E.00488
G1 X28.685 Y27.069 E.01381
G1 X28.953 Y26.934 E.01117
G1 X29.247 Y26.846 E.01142
G1 X29.582 Y26.807 E.01257
G1 X49.522 Y26.807 E.7427
G1 X49.908 Y26.86 E.0145
G1 X50.29 Y26.992 E.01507
G1 X50.474 Y27.106 E.00805
G1 X50.764 Y27.346 E.01401
G1 X50.856 Y27.445 E.00506
G1 X51.042 Y27.724 E.01249
G1 X51.156 Y27.98 E.01042
G1 X51.215 Y28.197 E.0084
G1 X51.254 Y28.534 E.01264
G1 X51.254 Y48.483 E.743
G1 X51.213 Y48.813 E.01241
G1 X51.083 Y49.208 E.01549
G1 X50.95 Y49.434 E.00975
G1 X50.715 Y49.717 E.0137
G1 X50.616 Y49.808 E.00503
G1 X50.337 Y49.995 E.01249
G1 X50.082 Y50.109 E.01042
G1 X49.864 Y50.167 E.0084
G1 X49.527 Y50.207 E.01264
G1 X29.579 Y50.207 E.743
G1 X29.248 Y50.165 E.01241
G1 X28.853 Y50.036 E.01549
G1 X28.627 Y49.903 E.00975
G1 X28.344 Y49.668 E.0137
G1 X28.253 Y49.569 E.00503
G1 X28.066 Y49.29 E.01249
G1 X27.952 Y49.034 E.01042
G1 X27.894 Y48.816 E.0084
G1 X27.855 Y48.479 E.01264
G1 X27.855 Y28.539 E.7427
G1 X27.908 Y28.151 E.01458
G1 X27.997 Y27.865 E.01116
G1 X28.155 Y27.585 E.01199
G1 X28.271 Y27.445 E.00679
G1 X28.623 Y27.736 F30000
G1 F3000
G1 X28.751 Y27.582 E.00746
G1 X28.957 Y27.436 E.00943
G1 X29.154 Y27.344 E.00811
G1 X29.296 Y27.3 E.00551
G1 X29.574 Y27.264 E.01044
G1 X49.531 Y27.264 E.74335
G1 X49.849 Y27.313 E.01198
G1 X50.057 Y27.385 E.00819
G1 X50.175 Y27.451 E.00504
G1 X50.479 Y27.703 E.0147
G1 X50.625 Y27.91 E.00943
G1 X50.717 Y28.107 E.0081
G1 X50.761 Y28.248 E.00551
G1 X50.797 Y28.526 E.01044
G1 X50.797 Y48.491 E.74361
G1 X50.778 Y48.672 E.00679
G1 X50.684 Y48.987 E.01222
G1 X50.606 Y49.133 E.00617
G1 X50.358 Y49.431 E.01445
G1 X50.151 Y49.578 E.00943
G1 X49.954 Y49.67 E.0081
G1 X49.813 Y49.713 E.00551
G1 X49.535 Y49.75 E.01044
G1 X29.57 Y49.75 E.74361
G1 X29.389 Y49.731 E.00679
G1 X29.074 Y49.637 E.01222
G1 X28.928 Y49.559 E.00617
G1 X28.63 Y49.311 E.01445
G1 X28.484 Y49.104 E.00943
G1 X28.391 Y48.907 E.00811
G1 X28.348 Y48.765 E.00551
G1 X28.312 Y48.487 E.01044
G1 X28.312 Y28.53 E.74335
G1 X28.361 Y28.212 E.01198
G1 X28.432 Y28.004 E.00819
G1 X28.499 Y27.886 E.00504
G1 X28.585 Y27.783 E.00501
G1 X28.944 Y28.055 F30000
G1 F3000
G1 X29.027 Y27.946 E.00513
G1 X29.141 Y27.855 E.00541
G1 X29.357 Y27.753 E.00892
G1 X29.565 Y27.721 E.00781
G1 X49.542 Y27.721 E.74407
G1 X49.775 Y27.764 E.00884
G1 X49.894 Y27.811 E.00475
G1 X50.116 Y27.979 E.01037
G1 X50.206 Y28.093 E.00541
G1 X50.308 Y28.31 E.00892
G1 X50.34 Y28.517 E.00782
G1 X50.34 Y48.498 E.74421
G1 X50.324 Y48.625 E.00475
G1 X50.248 Y48.85 E.00884
G1 X50.082 Y49.068 E.01023
G1 X49.968 Y49.159 E.00541
G1 X49.751 Y49.26 E.00892
M73 P29 R15
G1 X49.544 Y49.292 E.00782
G1 X29.563 Y49.292 E.74421
G1 X29.437 Y49.276 E.00475
G1 X29.211 Y49.201 E.00884
G1 X28.993 Y49.034 E.01023
G1 X28.902 Y48.921 E.00541
G1 X28.801 Y48.704 E.00892
G1 X28.769 Y48.496 E.00781
G1 X28.769 Y28.519 E.74407
G1 X28.811 Y28.286 E.00884
G1 X28.859 Y28.167 E.00475
G1 X28.907 Y28.103 E.00301
G1 X29.297 Y28.319 F30000
G1 F3000
G1 X29.301 Y28.311 E.00031
G1 X29.438 Y28.202 E.00652
G1 X29.554 Y28.178 E.00442
G1 X49.554 Y28.178 E.74492
G1 X49.665 Y28.207 E.00426
G1 X49.75 Y28.254 E.00361
G1 X49.859 Y28.391 E.00652
G1 X49.883 Y28.507 E.00442
G1 X49.883 Y48.507 E.74492
G1 X49.854 Y48.617 E.00426
G1 X49.807 Y48.702 E.00361
G1 X49.671 Y48.811 E.00652
G1 X49.554 Y48.835 E.00442
G1 X29.554 Y48.835 E.74492
G1 X29.444 Y48.807 E.00426
G1 X29.359 Y48.76 E.00361
G1 X29.25 Y48.623 E.00652
G1 X29.226 Y48.507 E.00442
G1 X29.226 Y28.507 E.74492
G1 X29.254 Y28.396 E.00426
G1 X29.268 Y28.371 E.00107
; WIPE_START
G1 F24000
G1 X29.301 Y28.311 E-.02592
G1 X29.438 Y28.202 E-.06647
M73 P29 R14
G1 X29.554 Y28.178 E-.04514
G1 X31.192 Y28.178 E-.62247
; WIPE_END
G1 E-.04 F1800
G1 X36.279 Y33.868 Z.6 F30000
G1 X47.783 Y46.736 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X31.326 Y46.736 E.61298
G1 X31.326 Y30.278 E.61298
G1 X47.783 Y30.278 E.61298
G1 X47.783 Y46.676 E.61075
G1 X48.24 Y47.193 F30000
G1 F3000
G1 X30.868 Y47.193 E.64703
G1 X30.868 Y29.821 E.64703
G1 X48.24 Y29.821 E.64703
G1 X48.24 Y47.133 E.64479
G1 X48.697 Y47.65 F30000
G1 F3000
G1 X30.411 Y47.65 E.68108
G1 X30.411 Y29.364 E.68108
G1 X48.697 Y29.364 E.68108
G1 X48.697 Y47.59 E.67884
G1 X49.154 Y48.107 F30000
; FEATURE: Outer wall
G1 F3000
G1 X29.954 Y48.107 E.71513
G1 X29.954 Y28.907 E.71513
G1 X49.154 Y28.907 E.71513
G1 X49.154 Y48.047 E.71289
; WIPE_START
G1 F24000
G1 X47.154 Y48.053 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.939 Y40.424 Z.6 F30000
G1 X46.658 Y30.461 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.508675
G1 F6300
G1 X47.395 Y31.198 E.03954
G1 X47.395 Y31.856 E.025
G1 X46.205 Y30.667 E.06385
G1 X45.546 Y30.667 E.025
G1 X47.395 Y32.515 E.09921
G1 X47.395 Y33.174 E.025
G1 X44.888 Y30.667 E.13456
G1 X44.229 Y30.667 E.025
G1 X47.395 Y33.832 E.16992
G1 X47.395 Y34.491 E.025
G1 X43.57 Y30.667 E.20527
G1 X42.911 Y30.667 E.025
G1 X47.395 Y35.15 E.24062
G1 X47.395 Y35.808 E.025
G1 X42.253 Y30.667 E.27598
G1 X41.594 Y30.667 E.025
G1 X47.395 Y36.467 E.31133
G1 X47.395 Y37.126 E.025
G1 X40.935 Y30.667 E.34668
G1 X40.277 Y30.667 E.025
G1 X47.395 Y37.784 E.38204
G1 X47.395 Y38.443 E.025
G1 X39.618 Y30.667 E.41739
G1 X38.959 Y30.667 E.025
G1 X47.395 Y39.102 E.45275
G1 X47.395 Y39.76 E.025
G1 X38.301 Y30.667 E.4881
G1 X37.642 Y30.667 E.025
G1 X47.395 Y40.419 E.52345
G1 X47.395 Y41.078 E.025
G1 X36.983 Y30.667 E.55881
G1 X36.325 Y30.667 E.025
G1 X47.395 Y41.736 E.59416
G1 X47.395 Y42.395 E.025
G1 X35.666 Y30.667 E.62951
G1 X35.007 Y30.667 E.025
G1 X47.395 Y43.054 E.66487
G1 X47.395 Y43.712 E.025
G1 X34.349 Y30.667 E.70022
G1 X33.69 Y30.667 E.025
G1 X47.395 Y44.371 E.73558
M73 P30 R14
G1 X47.395 Y45.03 E.025
G1 X33.031 Y30.667 E.77093
G1 X32.373 Y30.667 E.025
G1 X47.395 Y45.688 E.80628
G1 X47.395 Y46.347 E.025
G1 X31.714 Y30.667 E.84163
G1 X31.714 Y31.325 E.025
G1 X46.736 Y46.347 E.80628
G1 X46.077 Y46.347 E.025
G1 X31.714 Y31.984 E.77092
G1 X31.714 Y32.643 E.025
G1 X45.418 Y46.347 E.73557
G1 X44.76 Y46.347 E.025
G1 X31.714 Y33.301 E.70022
G1 X31.714 Y33.96 E.025
G1 X44.101 Y46.347 E.66486
G1 X43.442 Y46.347 E.025
G1 X31.714 Y34.619 E.62951
G1 X31.714 Y35.277 E.025
G1 X42.784 Y46.347 E.59415
G1 X42.125 Y46.347 E.025
G1 X31.714 Y35.936 E.5588
G1 X31.714 Y36.595 E.025
G1 X41.466 Y46.347 E.52345
G1 X40.808 Y46.347 E.025
G1 X31.714 Y37.253 E.48809
G1 X31.714 Y37.912 E.025
G1 X40.149 Y46.347 E.45274
G1 X39.49 Y46.347 E.025
G1 X31.714 Y38.571 E.41739
G1 X31.714 Y39.229 E.025
G1 X38.832 Y46.347 E.38203
G1 X38.173 Y46.347 E.025
G1 X31.714 Y39.888 E.34668
G1 X31.714 Y40.547 E.025
G1 X37.514 Y46.347 E.31132
G1 X36.856 Y46.347 E.025
G1 X31.714 Y41.205 E.27597
G1 X31.714 Y41.864 E.025
G1 X36.197 Y46.347 E.24062
G1 X35.538 Y46.347 E.025
G1 X31.714 Y42.523 E.20526
G1 X31.714 Y43.182 E.025
G1 X34.88 Y46.347 E.16991
G1 X34.221 Y46.347 E.025
G1 X31.714 Y43.84 E.13456
G1 X31.714 Y44.499 E.025
G1 X33.562 Y46.347 E.0992
G1 X32.904 Y46.347 E.025
G1 X31.714 Y45.158 E.06385
G1 X31.714 Y45.816 E.025
G1 X32.451 Y46.553 E.03953
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X31.714 Y45.816 E-.39584
G1 X31.714 Y45.158 E-.2503
G1 X31.926 Y45.369 E-.11387
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 2/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S252.45
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z.6 I-.128 J1.21 P1  F30000
G1 X48.138 Y47.091 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7980
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F7980
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F7980
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7980
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
M73 P31 R14
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.208 Y46.927 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421796
G1 F7980
G1 X47.805 Y46.331 E.02604
G1 X47.805 Y45.795 E.01654
G1 X46.842 Y46.757 E.04203
G1 X46.306 Y46.757 E.01654
G1 X47.805 Y45.259 E.06542
G1 X47.805 Y44.723 E.01654
G1 X45.771 Y46.757 E.08881
G1 X45.235 Y46.757 E.01654
G1 X47.805 Y44.187 E.11221
G1 X47.805 Y43.652 E.01654
G1 X44.699 Y46.757 E.1356
G1 X44.163 Y46.757 E.01654
G1 X47.805 Y43.116 E.159
G1 X47.805 Y42.58 E.01654
G1 X43.627 Y46.757 E.18239
G1 X43.092 Y46.757 E.01654
G1 X47.805 Y42.044 E.20579
G1 X47.805 Y41.508 E.01654
G1 X42.556 Y46.757 E.22918
G1 X42.02 Y46.757 E.01654
G1 X47.805 Y40.973 E.25258
G1 X47.805 Y40.437 E.01654
G1 X41.484 Y46.757 E.27597
G1 X40.948 Y46.757 E.01654
G1 X47.805 Y39.901 E.29937
G1 X47.805 Y39.365 E.01654
G1 X40.413 Y46.757 E.32276
G1 X39.877 Y46.757 E.01654
G1 X47.805 Y38.829 E.34615
G1 X47.805 Y38.293 E.01654
G1 X39.341 Y46.757 E.36955
G1 X38.805 Y46.757 E.01654
G1 X47.805 Y37.758 E.39294
G1 X47.805 Y37.222 E.01654
G1 X38.269 Y46.757 E.41634
G1 X37.733 Y46.757 E.01654
G1 X47.805 Y36.686 E.43973
G1 X47.805 Y36.15 E.01654
G1 X37.198 Y46.757 E.46313
G1 X36.662 Y46.757 E.01654
G1 X47.805 Y35.614 E.48652
G1 X47.805 Y35.079 E.01654
G1 X36.126 Y46.757 E.50992
G1 X35.59 Y46.757 E.01654
G1 X47.805 Y34.543 E.53331
G1 X47.805 Y34.007 E.01654
G1 X35.054 Y46.757 E.55671
G1 X34.519 Y46.757 E.01654
G1 X47.805 Y33.471 E.5801
G1 X47.805 Y32.935 E.01654
G1 X33.983 Y46.757 E.60349
G1 X33.447 Y46.757 E.01654
G1 X47.805 Y32.4 E.62689
G1 X47.805 Y31.864 E.01654
G1 X32.911 Y46.757 E.65028
G1 X32.375 Y46.757 E.01654
G1 X47.805 Y31.328 E.67368
G1 X47.805 Y30.792 E.01654
G1 X31.84 Y46.757 E.69707
G1 X31.304 Y46.757 E.01654
G1 X47.805 Y30.256 E.72046
G1 X47.269 Y30.256 E.01654
G1 X31.304 Y46.221 E.69707
G1 X31.304 Y45.686 E.01654
G1 X46.733 Y30.256 E.67367
G1 X46.197 Y30.256 E.01654
G1 X31.304 Y45.15 E.65028
G1 X31.304 Y44.614 E.01654
G1 X45.661 Y30.256 E.62688
G1 X45.126 Y30.256 E.01654
G1 X31.304 Y44.078 E.60349
G1 X31.304 Y43.542 E.01654
G1 X44.59 Y30.256 E.58009
G1 X44.054 Y30.256 E.01654
G1 X31.304 Y43.007 E.5567
G1 X31.304 Y42.471 E.01654
G1 X43.518 Y30.256 E.53331
G1 X42.982 Y30.256 E.01654
G1 X31.304 Y41.935 E.50991
G1 X31.304 Y41.399 E.01654
G1 X42.447 Y30.256 E.48652
G1 X41.911 Y30.256 E.01654
G1 X31.304 Y40.863 E.46312
G1 X31.304 Y40.328 E.01654
G1 X41.375 Y30.256 E.43973
G1 X40.839 Y30.256 E.01654
G1 X31.304 Y39.792 E.41633
G1 X31.304 Y39.256 E.01654
G1 X40.303 Y30.256 E.39294
G1 X39.768 Y30.256 E.01654
G1 X31.304 Y38.72 E.36954
G1 X31.304 Y38.184 E.01654
G1 X39.232 Y30.256 E.34615
G1 X38.696 Y30.256 E.01654
G1 X31.304 Y37.648 E.32276
G1 X31.304 Y37.113 E.01654
G1 X38.16 Y30.256 E.29936
G1 X37.624 Y30.256 E.01654
G1 X31.304 Y36.577 E.27597
G1 X31.304 Y36.041 E.01654
G1 X37.089 Y30.256 E.25257
G1 X36.553 Y30.256 E.01654
G1 X31.304 Y35.505 E.22918
G1 X31.304 Y34.969 E.01654
G1 X36.017 Y30.256 E.20578
G1 X35.481 Y30.256 E.01654
G1 X31.304 Y34.434 E.18239
G1 X31.304 Y33.898 E.01654
G1 X34.945 Y30.256 E.15899
G1 X34.409 Y30.256 E.01654
G1 X31.304 Y33.362 E.1356
G1 X31.304 Y32.826 E.01654
G1 X33.874 Y30.256 E.1122
G1 X33.338 Y30.256 E.01654
G1 X31.304 Y32.29 E.08881
G1 X31.304 Y31.755 E.01654
G1 X32.802 Y30.256 E.06542
G1 X32.266 Y30.256 E.01654
G1 X31.304 Y31.219 E.04202
G1 X31.304 Y30.683 E.01654
G1 X31.9 Y30.087 E.02603
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X31.304 Y30.683 E-.32045
G1 X31.304 Y31.219 E-.20361
G1 X31.743 Y30.78 E-.23595
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 3/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z.8 I-.858 J.863 P1  F30000
G1 X48.138 Y47.091 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8026
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F8026
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F8026
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8026
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.621 Y40.616 Z1 F30000
G1 X47.974 Y30.853 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421796
G1 F8026
G1 X47.378 Y30.256 E.02604
G1 X46.842 Y30.256 E.01654
G1 X47.805 Y31.219 E.04203
G1 X47.805 Y31.755 E.01654
G1 X46.306 Y30.256 E.06542
G1 X45.771 Y30.256 E.01654
G1 X47.805 Y32.29 E.08881
G1 X47.805 Y32.826 E.01654
G1 X45.235 Y30.256 E.11221
G1 X44.699 Y30.256 E.01654
G1 X47.805 Y33.362 E.1356
G1 X47.805 Y33.898 E.01654
G1 X44.163 Y30.256 E.159
G1 X43.627 Y30.256 E.01654
G1 X47.805 Y34.434 E.18239
G1 X47.805 Y34.97 E.01654
G1 X43.092 Y30.256 E.20579
G1 X42.556 Y30.256 E.01654
G1 X47.805 Y35.505 E.22918
G1 X47.805 Y36.041 E.01654
G1 X42.02 Y30.256 E.25258
G1 X41.484 Y30.256 E.01654
G1 X47.805 Y36.577 E.27597
G1 X47.805 Y37.113 E.01654
M73 P32 R14
G1 X40.948 Y30.256 E.29937
G1 X40.413 Y30.256 E.01654
G1 X47.805 Y37.649 E.32276
G1 X47.805 Y38.184 E.01654
G1 X39.877 Y30.256 E.34615
G1 X39.341 Y30.256 E.01654
G1 X47.805 Y38.72 E.36955
G1 X47.805 Y39.256 E.01654
G1 X38.805 Y30.256 E.39294
G1 X38.269 Y30.256 E.01654
G1 X47.805 Y39.792 E.41634
G1 X47.805 Y40.328 E.01654
G1 X37.733 Y30.256 E.43973
G1 X37.198 Y30.256 E.01654
G1 X47.805 Y40.863 E.46313
G1 X47.805 Y41.399 E.01654
G1 X36.662 Y30.256 E.48652
G1 X36.126 Y30.256 E.01654
G1 X47.805 Y41.935 E.50992
G1 X47.805 Y42.471 E.01654
G1 X35.59 Y30.256 E.53331
G1 X35.054 Y30.256 E.01654
G1 X47.805 Y43.007 E.55671
G1 X47.805 Y43.543 E.01654
G1 X34.519 Y30.256 E.5801
G1 X33.983 Y30.256 E.01654
G1 X47.805 Y44.078 E.60349
G1 X47.805 Y44.614 E.01654
G1 X33.447 Y30.256 E.62689
G1 X32.911 Y30.256 E.01654
G1 X47.805 Y45.15 E.65028
G1 X47.805 Y45.686 E.01654
G1 X32.375 Y30.256 E.67368
G1 X31.84 Y30.256 E.01654
G1 X47.805 Y46.222 E.69707
G1 X47.805 Y46.757 E.01654
G1 X31.304 Y30.256 E.72046
G1 X31.304 Y30.792 E.01654
G1 X47.269 Y46.757 E.69707
G1 X46.733 Y46.757 E.01654
G1 X31.304 Y31.328 E.67367
G1 X31.304 Y31.864 E.01654
G1 X46.197 Y46.757 E.65028
G1 X45.661 Y46.757 E.01654
G1 X31.304 Y32.4 E.62688
G1 X31.304 Y32.935 E.01654
G1 X45.126 Y46.757 E.60349
G1 X44.59 Y46.757 E.01654
G1 X31.304 Y33.471 E.58009
G1 X31.304 Y34.007 E.01654
G1 X44.054 Y46.757 E.5567
G1 X43.518 Y46.757 E.01654
G1 X31.304 Y34.543 E.53331
G1 X31.304 Y35.079 E.01654
G1 X42.982 Y46.757 E.50991
G1 X42.447 Y46.757 E.01654
G1 X31.304 Y35.615 E.48652
G1 X31.304 Y36.15 E.01654
G1 X41.911 Y46.757 E.46312
G1 X41.375 Y46.757 E.01654
G1 X31.304 Y36.686 E.43973
G1 X31.304 Y37.222 E.01654
G1 X40.839 Y46.757 E.41633
G1 X40.303 Y46.757 E.01654
G1 X31.304 Y37.758 E.39294
G1 X31.304 Y38.294 E.01654
G1 X39.768 Y46.757 E.36954
G1 X39.232 Y46.757 E.01654
G1 X31.304 Y38.829 E.34615
G1 X31.304 Y39.365 E.01654
G1 X38.696 Y46.757 E.32276
G1 X38.16 Y46.757 E.01654
G1 X31.304 Y39.901 E.29936
G1 X31.304 Y40.437 E.01654
G1 X37.624 Y46.757 E.27597
G1 X37.089 Y46.757 E.01654
G1 X31.304 Y40.973 E.25257
G1 X31.304 Y41.508 E.01654
G1 X36.553 Y46.757 E.22918
G1 X36.017 Y46.757 E.01654
G1 X31.304 Y42.044 E.20578
G1 X31.304 Y42.58 E.01654
G1 X35.481 Y46.757 E.18239
G1 X34.945 Y46.757 E.01654
G1 X31.304 Y43.116 E.15899
G1 X31.304 Y43.652 E.01654
G1 X34.409 Y46.757 E.1356
G1 X33.874 Y46.757 E.01654
G1 X31.304 Y44.188 E.1122
G1 X31.304 Y44.723 E.01654
G1 X33.338 Y46.757 E.08881
G1 X32.802 Y46.757 E.01654
G1 X31.304 Y45.259 E.06542
G1 X31.304 Y45.795 E.01654
G1 X32.266 Y46.757 E.04202
G1 X31.73 Y46.757 E.01654
G1 X31.134 Y46.161 E.02603
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X31.73 Y46.757 E-.32044
G1 X32.266 Y46.757 E-.20361
G1 X31.827 Y46.318 E-.23595
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 4/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z1 I-.058 J1.216 P1  F30000
G1 X48.138 Y47.091 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3230
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3230
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3230
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3230
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z1.2 F30000
G1 X45.042 Y30.271 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3230
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3230
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 5/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z1.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
M73 P33 R14
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 6/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z1.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
M73 P33 R13
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z1.6 F30000
G1 X45.042 Y30.271 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
M73 P34 R13
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 7/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z1.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 8/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z1.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P35 R13
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z2 F30000
G1 X45.042 Y30.271 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 9/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
M73 P36 R13
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 10/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z2.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z2.4 F30000
G1 X45.042 Y30.271 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 11/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z2.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
M73 P37 R13
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 12/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z2.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z2.8 F30000
G1 X45.042 Y30.271 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
M73 P38 R13
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 13/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z2.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
M73 P38 R12
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 14/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z3 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P39 R12
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z3.2 F30000
G1 X45.042 Y30.271 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 15/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z3.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
M73 P40 R12
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 16/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z3.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z3.6 F30000
G1 X45.042 Y30.271 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 17/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z3.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
M73 P41 R12
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 18/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z3.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z4 F30000
G1 X45.042 Y30.271 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
M73 P42 R12
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 19/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 20/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z4.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P43 R12
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z4.4 F30000
G1 X45.042 Y30.271 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
M73 P43 R11
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 21/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z4.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
M73 P44 R11
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 22/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z4.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z4.8 F30000
G1 X45.042 Y30.271 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 23/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P45 R11
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 24/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z5 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z5.2 F30000
G1 X45.042 Y30.271 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
M73 P46 R11
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 25/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z5.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 26/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z5.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P47 R11
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z5.6 F30000
G1 X45.042 Y30.271 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 27/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z5.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
M73 P48 R11
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
M73 P48 R10
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 28/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z5.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z6 F30000
G1 X45.042 Y30.271 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 29/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P49 R10
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 30/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z6.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z6.4 F30000
G1 X45.042 Y30.271 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
M73 P50 R10
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 31/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z6.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 32/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z6.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P51 R10
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z6.8 F30000
G1 X45.042 Y30.271 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 33/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z6.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
M73 P52 R10
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 34/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z7 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z7.2 F30000
G1 X45.042 Y30.271 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P52 R9
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 35/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z7.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P53 R9
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 36/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z7.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z7.6 F30000
G1 X45.042 Y30.271 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
M73 P54 R9
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 37/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 38/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z7.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P55 R9
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z8 F30000
G1 X45.042 Y30.271 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 39/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
M73 P56 R9
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 40/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z8.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z8.4 F30000
G1 X45.042 Y30.271 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 41/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z8.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
M73 P57 R9
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 42/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z8.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z8.6
M73 P57 R8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z8.8 F30000
G1 X45.042 Y30.271 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
M73 P58 R8
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 43/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z8.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 44/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z9 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
M73 P59 R8
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z9.2 F30000
G1 X45.042 Y30.271 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 45/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z9.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
M73 P60 R8
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 46/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z9.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z9.6 F30000
G1 X45.042 Y30.271 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 47/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z9.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
M73 P61 R8
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 48/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z9.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z10 F30000
G1 X45.042 Y30.271 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
M73 P62 R8
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 49/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z10 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
M73 P62 R7
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 50/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z10.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
M73 P63 R7
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z10.4 F30000
G1 X45.042 Y30.271 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 51/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
M73 P64 R7
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 52/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z10.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z10.8 F30000
G1 X45.042 Y30.271 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 53/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z10.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
M73 P65 R7
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 54/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z11 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z11.2 F30000
G1 X45.042 Y30.271 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
M73 P66 R7
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 55/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z11.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 56/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z11.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P66 R6
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
M73 P67 R6
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z11.6 F30000
G1 X45.042 Y30.271 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 57/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z11.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
M73 P68 R6
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 58/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z11.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z12 F30000
G1 X45.042 Y30.271 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 59/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z12 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
M73 P69 R6
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 60/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z12.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z12.4 F30000
G1 X45.042 Y30.271 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
M73 P70 R6
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 61/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z12.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 62/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z12.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
M73 P71 R6
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z12.8 F30000
G1 X45.042 Y30.271 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 63/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z12.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
M73 P71 R5
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z13 F30000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
M73 P72 R5
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 64/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z13 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z13.2 F30000
G1 X45.042 Y30.271 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 65/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z13.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
M73 P73 R5
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z13.4 F30000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 66/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z13.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z13.6 F30000
G1 X45.042 Y30.271 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
M73 P74 R5
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 67/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z13.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 68/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z13.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
M73 P75 R5
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z14 F30000
G1 X45.042 Y30.271 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 69/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z14 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
M73 P76 R5
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 70/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z14.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
M73 P76 R4
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z14.4 F30000
G1 X45.042 Y30.271 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 71/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z14.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
M73 P77 R4
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 72/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z14.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z14.8 F30000
G1 X45.042 Y30.271 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
M73 P78 R4
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 73/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z14.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 74/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z15 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
M73 P79 R4
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z15.2 F30000
G1 X45.042 Y30.271 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 75/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z15.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
M73 P80 R4
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 76/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z15.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z15.6 F30000
G1 X45.042 Y30.271 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 77/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z15.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
M73 P81 R4
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
M73 P81 R3
G1 E-.04 F1800
G1 X47.79 Y43.995 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 78/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z15.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z16 F30000
G1 X45.042 Y30.271 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
M73 P82 R3
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 79/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z16 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 80/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z16.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
M73 P83 R3
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z16.4 F30000
G1 X45.042 Y30.271 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 81/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z16.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
M73 P84 R3
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 82/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z16.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z16.8 F30000
G1 X45.042 Y30.271 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 83/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z16.8 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
M73 P85 R3
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 84/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z17 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z17.2 F30000
G1 X45.042 Y30.271 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
M73 P85 R2
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
M73 P86 R2
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 85/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z17.2 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 86/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z17.4 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
M73 P87 R2
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z17.6 F30000
G1 X45.042 Y30.271 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 87/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z17.6 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
M73 P88 R2
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 88/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z17.8 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z18 F30000
G1 X45.042 Y30.271 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 89/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z18 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
M73 P89 R2
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 90/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z18.2 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3231
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3231
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3231
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.375 Y40.672 Z18.4 F30000
G1 X45.042 Y30.271 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3231
G1 X46.671 Y30.271 E.05401
G1 X47.79 Y31.39 E.0525
G1 X47.79 Y30.271 E.03712
G1 X31.319 Y46.742 E.77269
G1 X31.319 Y45.623 E.03712
G1 X32.438 Y46.742 E.0525
G1 X38.995 Y46.742 E.2175
G1 X47.79 Y37.947 E.41259
G1 X47.79 Y39.066 E.03712
G1 X38.995 Y30.271 E.41259
G1 X40.114 Y30.271 E.03712
G1 X31.319 Y39.066 E.41259
G1 X31.319 Y37.947 E.03712
G1 X40.114 Y46.742 E.41259
G1 X41.742 Y46.742 E.05401
G1 X31.319 Y33.019 F30000
G1 F3231
G1 X31.319 Y31.39 E.05401
G1 X32.438 Y30.271 E.0525
G1 X31.319 Y30.271 E.03712
G1 X47.79 Y46.742 E.77269
G1 X46.671 Y46.742 E.03712
M73 P90 R2
G1 X47.79 Y45.623 E.0525
G1 X47.79 Y43.995 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.79 Y45.623 E-.61876
G1 X47.527 Y45.886 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 91/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z18.4 I-1.085 J.551 P1  F30000
G1 X48.138 Y47.091 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3207
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3207
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3207
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3207
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y43.995 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3207
G1 X47.79 Y45.623 E.05401
G1 X46.671 Y46.742 E.0525
G1 X47.79 Y46.742 E.03712
G1 X31.319 Y30.271 E.77269
G1 X32.438 Y30.271 E.03712
G1 X31.319 Y31.39 E.0525
G1 X31.319 Y33.019 E.05401
G1 X41.742 Y46.742 F30000
G1 F3207
M73 P90 R1
G1 X40.114 Y46.742 E.05401
G1 X31.319 Y37.947 E.41259
G1 X31.319 Y39.066 E.03712
G1 X40.114 Y30.271 E.41259
G1 X38.995 Y30.271 E.03712
G1 X47.79 Y39.066 E.41259
G1 X47.79 Y37.947 E.03712
G1 X38.995 Y46.742 E.41259
G1 X32.438 Y46.742 E.2175
G1 X31.319 Y45.623 E.0525
G1 X31.319 Y46.742 E.03712
G1 X47.79 Y30.271 E.77269
G1 X47.79 Y31.39 E.03712
G1 X46.671 Y30.271 E.0525
G1 X45.042 Y30.271 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X46.671 Y30.271 E-.61876
G1 X46.934 Y30.534 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 92/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z18.6 I-1.214 J.088 P1  F30000
G1 X48.138 Y47.091 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3614
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3614
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
M73 P91 R1
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3614
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3614
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y46.742 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3614
G1 X31.319 Y46.742 E.54637
G1 X31.319 Y30.271 E.54637
G1 X47.79 Y30.271 E.54637
G1 X47.79 Y46.682 E.54438
G1 X45.449 Y30.678 F30000
G1 F3614
G1 X47.078 Y30.678 E.05401
G1 X47.383 Y30.983 E.0143
G1 X47.383 Y30.678 E.01011
G1 X31.726 Y46.335 E.73449
G1 X31.726 Y46.03 E.01011
G1 X32.031 Y46.335 E.0143
G1 X39.402 Y46.335 E.24451
G1 X47.383 Y38.354 E.3744
G1 X47.383 Y38.659 E.01011
G1 X39.402 Y30.678 E.3744
G1 X39.707 Y30.678 E.01011
G1 X31.726 Y38.659 E.3744
G1 X31.726 Y38.354 E.01011
G1 X39.707 Y46.335 E.3744
G1 X41.335 Y46.335 E.05401
G1 X31.726 Y32.612 F30000
G1 F3614
G1 X31.726 Y30.983 E.05401
G1 X32.031 Y30.678 E.0143
G1 X31.726 Y30.678 E.01011
G1 X47.383 Y46.335 E.73449
G1 X47.078 Y46.335 E.01011
G1 X47.383 Y46.03 E.0143
G1 X47.383 Y44.402 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.383 Y46.03 E-.61876
G1 X47.12 Y46.293 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 93/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I-.75 J.958 P1  F30000
G1 X48.138 Y47.091 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3587
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3587
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3587
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3587
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y46.742 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3587
G1 X31.319 Y46.742 E.54637
G1 X31.319 Y30.271 E.54637
G1 X47.79 Y30.271 E.54637
G1 X47.79 Y46.682 E.54438
G1 X47.383 Y44.402 F30000
G1 F3587
G1 X47.383 Y46.03 E.05401
G1 X47.078 Y46.335 E.0143
G1 X47.383 Y46.335 E.01011
G1 X31.726 Y30.678 E.73449
G1 X32.031 Y30.678 E.01011
G1 X31.726 Y30.983 E.0143
G1 X31.726 Y32.612 E.05401
G1 X41.335 Y46.335 F30000
G1 F3587
G1 X39.707 Y46.335 E.05401
G1 X31.726 Y38.354 E.3744
G1 X31.726 Y38.659 E.01011
G1 X39.707 Y30.678 E.3744
G1 X39.402 Y30.678 E.01011
G1 X47.383 Y38.659 E.3744
G1 X47.383 Y38.354 E.01011
G1 X39.402 Y46.335 E.3744
G1 X32.031 Y46.335 E.24451
M73 P92 R1
G1 X31.726 Y46.03 E.0143
G1 X31.726 Y46.335 E.01011
G1 X47.383 Y30.678 E.73449
G1 X47.383 Y30.983 E.01011
G1 X47.078 Y30.678 E.0143
G1 X45.449 Y30.678 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X47.078 Y30.678 E-.61876
G1 X47.341 Y30.941 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 94/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z19 I-1.215 J.06 P1  F30000
G1 X48.138 Y47.091 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3613
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F3613
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3613
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3613
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y46.742 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3613
G1 X31.319 Y46.742 E.54637
G1 X31.319 Y30.271 E.54637
G1 X47.79 Y30.271 E.54637
G1 X47.79 Y46.682 E.54438
G1 X45.449 Y30.678 F30000
G1 F3613
G1 X47.078 Y30.678 E.05401
G1 X47.383 Y30.983 E.0143
G1 X47.383 Y30.678 E.01011
G1 X31.726 Y46.335 E.73449
G1 X31.726 Y46.03 E.01011
G1 X32.031 Y46.335 E.0143
G1 X39.402 Y46.335 E.24451
G1 X47.383 Y38.354 E.3744
G1 X47.383 Y38.659 E.01011
G1 X39.402 Y30.678 E.3744
G1 X39.707 Y30.678 E.01011
G1 X31.726 Y38.659 E.3744
G1 X31.726 Y38.354 E.01011
G1 X39.707 Y46.335 E.3744
G1 X41.335 Y46.335 E.05401
G1 X31.726 Y32.612 F30000
G1 F3613
G1 X31.726 Y30.983 E.05401
G1 X32.031 Y30.678 E.0143
G1 X31.726 Y30.678 E.01011
G1 X47.383 Y46.335 E.73449
G1 X47.078 Y46.335 E.01011
G1 X47.383 Y46.03 E.0143
G1 X47.383 Y44.402 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.383 Y46.03 E-.61876
G1 X47.12 Y46.293 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 95/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z19.2 I-.75 J.958 P1  F30000
G1 X48.138 Y47.091 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3587
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
M73 P93 R1
G1 X48.545 Y47.498 F30000
G1 F3587
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F3587
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3587
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.79 Y46.742 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3587
G1 X31.319 Y46.742 E.54637
G1 X31.319 Y30.271 E.54637
G1 X47.79 Y30.271 E.54637
G1 X47.79 Y46.682 E.54438
G1 X47.383 Y44.402 F30000
G1 F3587
G1 X47.383 Y46.03 E.05401
G1 X47.078 Y46.335 E.0143
G1 X47.383 Y46.335 E.01011
G1 X31.726 Y30.678 E.73449
G1 X32.031 Y30.678 E.01011
G1 X31.726 Y30.983 E.0143
G1 X31.726 Y32.612 E.05401
G1 X41.335 Y46.335 F30000
G1 F3587
G1 X39.707 Y46.335 E.05401
G1 X31.726 Y38.354 E.3744
G1 X31.726 Y38.659 E.01011
G1 X39.707 Y30.678 E.3744
G1 X39.402 Y30.678 E.01011
G1 X47.383 Y38.659 E.3744
G1 X47.383 Y38.354 E.01011
G1 X39.402 Y46.335 E.3744
G1 X32.031 Y46.335 E.24451
G1 X31.726 Y46.03 E.0143
G1 X31.726 Y46.335 E.01011
G1 X47.383 Y30.678 E.73449
G1 X47.383 Y30.983 E.01011
G1 X47.078 Y30.678 E.0143
G1 X45.449 Y30.678 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.078 Y30.678 E-.61876
G1 X47.341 Y30.941 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 96/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
M106 S242.25
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z19.4 I-1.215 J.06 P1  F30000
G1 X48.138 Y47.091 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F8843.478
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F8843.478
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.611 Y40.615 Z19.6 F30000
G1 X47.971 Y30.296 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.406164
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X31.34 Y30.296 E.87793
G1 X31.34 Y30.752 E.02408
G1 X47.768 Y30.752 E.86724
G1 X47.768 Y31.208 E.02408
G1 X31.34 Y31.208 E.86724
G1 X31.34 Y31.664 E.02408
G1 X47.768 Y31.664 E.86724
G1 X47.768 Y32.121 E.02408
G1 X31.34 Y32.121 E.86724
G1 X31.34 Y32.577 E.02408
G1 X47.768 Y32.577 E.86724
G1 X47.768 Y33.033 E.02408
G1 X31.34 Y33.033 E.86724
G1 X31.34 Y33.489 E.02408
G1 X47.768 Y33.489 E.86724
G1 X47.768 Y33.945 E.02408
G1 X31.34 Y33.945 E.86724
G1 X31.34 Y34.401 E.02408
G1 X47.768 Y34.401 E.86724
G1 X47.768 Y34.858 E.02408
G1 X31.34 Y34.858 E.86724
G1 X31.34 Y35.314 E.02408
G1 X47.768 Y35.314 E.86724
G1 X47.768 Y35.77 E.02408
M73 P94 R1
G1 X31.34 Y35.77 E.86724
G1 X31.34 Y36.226 E.02408
G1 X47.768 Y36.226 E.86724
G1 X47.768 Y36.682 E.02408
G1 X31.34 Y36.682 E.86724
G1 X31.34 Y37.138 E.02408
G1 X47.768 Y37.138 E.86724
G1 X47.768 Y37.595 E.02408
G1 X31.34 Y37.595 E.86724
G1 X31.34 Y38.051 E.02408
G1 X47.768 Y38.051 E.86724
G1 X47.768 Y38.507 E.02408
G1 X31.34 Y38.507 E.86724
G1 X31.34 Y38.963 E.02408
G1 X47.768 Y38.963 E.86724
G1 X47.768 Y39.419 E.02408
G1 X31.34 Y39.419 E.86724
G1 X31.34 Y39.875 E.02408
G1 X47.768 Y39.875 E.86724
G1 X47.768 Y40.332 E.02408
G1 X31.34 Y40.332 E.86724
G1 X31.34 Y40.788 E.02408
G1 X47.768 Y40.788 E.86724
G1 X47.768 Y41.244 E.02408
G1 X31.34 Y41.244 E.86724
G1 X31.34 Y41.7 E.02408
G1 X47.768 Y41.7 E.86724
G1 X47.768 Y42.156 E.02408
G1 X31.34 Y42.156 E.86724
G1 X31.34 Y42.612 E.02408
G1 X47.768 Y42.612 E.86724
G1 X47.768 Y43.069 E.02408
G1 X31.34 Y43.069 E.86724
G1 X31.34 Y43.525 E.02408
G1 X47.768 Y43.525 E.86724
G1 X47.768 Y43.981 E.02408
G1 X31.34 Y43.981 E.86724
G1 X31.34 Y44.437 E.02408
G1 X47.768 Y44.437 E.86724
G1 X47.768 Y44.893 E.02408
G1 X31.34 Y44.893 E.86724
G1 X31.34 Y45.349 E.02408
G1 X47.768 Y45.349 E.86724
G1 X47.768 Y45.806 E.02408
G1 X31.34 Y45.806 E.86724
G1 X31.34 Y46.262 E.02408
G1 X47.768 Y46.262 E.86724
G1 X47.768 Y46.718 E.02408
G1 X31.138 Y46.718 E.87793
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X33.138 Y46.718 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 97/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
M106 S252.45
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z19.6 I-.03 J1.217 P1  F30000
G1 X48.138 Y47.091 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8012
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F8012
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F8012
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8012
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.621 Y40.616 Z19.8 F30000
G1 X47.974 Y30.853 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421796
G1 F8012
G1 X47.378 Y30.256 E.02604
G1 X46.842 Y30.256 E.01654
M73 P95 R1
G1 X47.805 Y31.219 E.04203
G1 X47.805 Y31.755 E.01654
G1 X46.306 Y30.256 E.06542
G1 X45.771 Y30.256 E.01654
G1 X47.805 Y32.29 E.08881
G1 X47.805 Y32.826 E.01654
G1 X45.235 Y30.256 E.11221
G1 X44.699 Y30.256 E.01654
G1 X47.805 Y33.362 E.1356
G1 X47.805 Y33.898 E.01654
G1 X44.163 Y30.256 E.159
G1 X43.627 Y30.256 E.01654
G1 X47.805 Y34.434 E.18239
G1 X47.805 Y34.97 E.01654
G1 X43.092 Y30.256 E.20579
G1 X42.556 Y30.256 E.01654
G1 X47.805 Y35.505 E.22918
G1 X47.805 Y36.041 E.01654
G1 X42.02 Y30.256 E.25258
G1 X41.484 Y30.256 E.01654
G1 X47.805 Y36.577 E.27597
G1 X47.805 Y37.113 E.01654
G1 X40.948 Y30.256 E.29937
G1 X40.413 Y30.256 E.01654
G1 X47.805 Y37.649 E.32276
G1 X47.805 Y38.184 E.01654
G1 X39.877 Y30.256 E.34615
G1 X39.341 Y30.256 E.01654
G1 X47.805 Y38.72 E.36955
G1 X47.805 Y39.256 E.01654
G1 X38.805 Y30.256 E.39294
G1 X38.269 Y30.256 E.01654
G1 X47.805 Y39.792 E.41634
G1 X47.805 Y40.328 E.01654
M73 P95 R0
G1 X37.733 Y30.256 E.43973
G1 X37.198 Y30.256 E.01654
G1 X47.805 Y40.863 E.46313
G1 X47.805 Y41.399 E.01654
G1 X36.662 Y30.256 E.48652
G1 X36.126 Y30.256 E.01654
G1 X47.805 Y41.935 E.50992
G1 X47.805 Y42.471 E.01654
G1 X35.59 Y30.256 E.53331
G1 X35.054 Y30.256 E.01654
G1 X47.805 Y43.007 E.55671
G1 X47.805 Y43.543 E.01654
G1 X34.519 Y30.256 E.5801
G1 X33.983 Y30.256 E.01654
G1 X47.805 Y44.078 E.60349
G1 X47.805 Y44.614 E.01654
G1 X33.447 Y30.256 E.62689
G1 X32.911 Y30.256 E.01654
G1 X47.805 Y45.15 E.65028
G1 X47.805 Y45.686 E.01654
G1 X32.375 Y30.256 E.67368
G1 X31.84 Y30.256 E.01654
G1 X47.805 Y46.222 E.69707
G1 X47.805 Y46.757 E.01654
G1 X31.304 Y30.256 E.72046
G1 X31.304 Y30.792 E.01654
G1 X47.269 Y46.757 E.69707
G1 X46.733 Y46.757 E.01654
G1 X31.304 Y31.328 E.67367
G1 X31.304 Y31.864 E.01654
G1 X46.197 Y46.757 E.65028
G1 X45.661 Y46.757 E.01654
G1 X31.304 Y32.4 E.62688
G1 X31.304 Y32.935 E.01654
G1 X45.126 Y46.757 E.60349
G1 X44.59 Y46.757 E.01654
G1 X31.304 Y33.471 E.58009
G1 X31.304 Y34.007 E.01654
G1 X44.054 Y46.757 E.5567
G1 X43.518 Y46.757 E.01654
G1 X31.304 Y34.543 E.53331
G1 X31.304 Y35.079 E.01654
G1 X42.982 Y46.757 E.50991
G1 X42.447 Y46.757 E.01654
G1 X31.304 Y35.615 E.48652
G1 X31.304 Y36.15 E.01654
G1 X41.911 Y46.757 E.46312
G1 X41.375 Y46.757 E.01654
G1 X31.304 Y36.686 E.43973
G1 X31.304 Y37.222 E.01654
G1 X40.839 Y46.757 E.41633
G1 X40.303 Y46.757 E.01654
G1 X31.304 Y37.758 E.39294
G1 X31.304 Y38.294 E.01654
G1 X39.768 Y46.757 E.36954
G1 X39.232 Y46.757 E.01654
G1 X31.304 Y38.829 E.34615
G1 X31.304 Y39.365 E.01654
G1 X38.696 Y46.757 E.32276
G1 X38.16 Y46.757 E.01654
G1 X31.304 Y39.901 E.29936
G1 X31.304 Y40.437 E.01654
G1 X37.624 Y46.757 E.27597
G1 X37.089 Y46.757 E.01654
G1 X31.304 Y40.973 E.25257
G1 X31.304 Y41.508 E.01654
G1 X36.553 Y46.757 E.22918
G1 X36.017 Y46.757 E.01654
G1 X31.304 Y42.044 E.20578
G1 X31.304 Y42.58 E.01654
G1 X35.481 Y46.757 E.18239
G1 X34.945 Y46.757 E.01654
G1 X31.304 Y43.116 E.15899
G1 X31.304 Y43.652 E.01654
G1 X34.409 Y46.757 E.1356
G1 X33.874 Y46.757 E.01654
G1 X31.304 Y44.188 E.1122
G1 X31.304 Y44.723 E.01654
G1 X33.338 Y46.757 E.08881
G1 X32.802 Y46.757 E.01654
G1 X31.304 Y45.259 E.06542
G1 X31.304 Y45.795 E.01654
G1 X32.266 Y46.757 E.04202
G1 X31.73 Y46.757 E.01654
G1 X31.134 Y46.161 E.02603
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X31.73 Y46.757 E-.32044
G1 X32.266 Y46.757 E-.20361
G1 X31.827 Y46.318 E-.23595
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 98/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z19.8 I-.058 J1.216 P1  F30000
G1 X48.138 Y47.091 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7980
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F7980
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F7980
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7980
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.208 Y46.927 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421796
G1 F7980
G1 X47.805 Y46.331 E.02604
G1 X47.805 Y45.795 E.01654
G1 X46.842 Y46.757 E.04203
G1 X46.306 Y46.757 E.01654
G1 X47.805 Y45.259 E.06542
G1 X47.805 Y44.723 E.01654
G1 X45.771 Y46.757 E.08881
G1 X45.235 Y46.757 E.01654
G1 X47.805 Y44.187 E.11221
G1 X47.805 Y43.652 E.01654
G1 X44.699 Y46.757 E.1356
G1 X44.163 Y46.757 E.01654
G1 X47.805 Y43.116 E.159
G1 X47.805 Y42.58 E.01654
G1 X43.627 Y46.757 E.18239
G1 X43.092 Y46.757 E.01654
G1 X47.805 Y42.044 E.20579
G1 X47.805 Y41.508 E.01654
G1 X42.556 Y46.757 E.22918
G1 X42.02 Y46.757 E.01654
G1 X47.805 Y40.973 E.25258
G1 X47.805 Y40.437 E.01654
G1 X41.484 Y46.757 E.27597
G1 X40.948 Y46.757 E.01654
G1 X47.805 Y39.901 E.29937
G1 X47.805 Y39.365 E.01654
G1 X40.413 Y46.757 E.32276
G1 X39.877 Y46.757 E.01654
M73 P96 R0
G1 X47.805 Y38.829 E.34615
G1 X47.805 Y38.293 E.01654
G1 X39.341 Y46.757 E.36955
G1 X38.805 Y46.757 E.01654
G1 X47.805 Y37.758 E.39294
G1 X47.805 Y37.222 E.01654
G1 X38.269 Y46.757 E.41634
G1 X37.733 Y46.757 E.01654
G1 X47.805 Y36.686 E.43973
G1 X47.805 Y36.15 E.01654
G1 X37.198 Y46.757 E.46313
G1 X36.662 Y46.757 E.01654
G1 X47.805 Y35.614 E.48652
G1 X47.805 Y35.079 E.01654
G1 X36.126 Y46.757 E.50992
G1 X35.59 Y46.757 E.01654
G1 X47.805 Y34.543 E.53331
G1 X47.805 Y34.007 E.01654
G1 X35.054 Y46.757 E.55671
G1 X34.519 Y46.757 E.01654
G1 X47.805 Y33.471 E.5801
G1 X47.805 Y32.935 E.01654
G1 X33.983 Y46.757 E.60349
G1 X33.447 Y46.757 E.01654
G1 X47.805 Y32.4 E.62689
G1 X47.805 Y31.864 E.01654
G1 X32.911 Y46.757 E.65028
G1 X32.375 Y46.757 E.01654
G1 X47.805 Y31.328 E.67368
G1 X47.805 Y30.792 E.01654
G1 X31.84 Y46.757 E.69707
G1 X31.304 Y46.757 E.01654
G1 X47.805 Y30.256 E.72046
G1 X47.269 Y30.256 E.01654
G1 X31.304 Y46.221 E.69707
G1 X31.304 Y45.686 E.01654
G1 X46.733 Y30.256 E.67367
G1 X46.197 Y30.256 E.01654
G1 X31.304 Y45.15 E.65028
G1 X31.304 Y44.614 E.01654
G1 X45.661 Y30.256 E.62688
G1 X45.126 Y30.256 E.01654
G1 X31.304 Y44.078 E.60349
G1 X31.304 Y43.542 E.01654
G1 X44.59 Y30.256 E.58009
G1 X44.054 Y30.256 E.01654
G1 X31.304 Y43.007 E.5567
G1 X31.304 Y42.471 E.01654
G1 X43.518 Y30.256 E.53331
G1 X42.982 Y30.256 E.01654
G1 X31.304 Y41.935 E.50991
G1 X31.304 Y41.399 E.01654
G1 X42.447 Y30.256 E.48652
G1 X41.911 Y30.256 E.01654
G1 X31.304 Y40.863 E.46312
G1 X31.304 Y40.328 E.01654
G1 X41.375 Y30.256 E.43973
G1 X40.839 Y30.256 E.01654
G1 X31.304 Y39.792 E.41633
G1 X31.304 Y39.256 E.01654
G1 X40.303 Y30.256 E.39294
G1 X39.768 Y30.256 E.01654
G1 X31.304 Y38.72 E.36954
G1 X31.304 Y38.184 E.01654
G1 X39.232 Y30.256 E.34615
G1 X38.696 Y30.256 E.01654
G1 X31.304 Y37.648 E.32276
G1 X31.304 Y37.113 E.01654
G1 X38.16 Y30.256 E.29936
G1 X37.624 Y30.256 E.01654
G1 X31.304 Y36.577 E.27597
G1 X31.304 Y36.041 E.01654
G1 X37.089 Y30.256 E.25257
G1 X36.553 Y30.256 E.01654
G1 X31.304 Y35.505 E.22918
G1 X31.304 Y34.969 E.01654
G1 X36.017 Y30.256 E.20578
G1 X35.481 Y30.256 E.01654
G1 X31.304 Y34.434 E.18239
G1 X31.304 Y33.898 E.01654
G1 X34.945 Y30.256 E.15899
G1 X34.409 Y30.256 E.01654
G1 X31.304 Y33.362 E.1356
G1 X31.304 Y32.826 E.01654
G1 X33.874 Y30.256 E.1122
G1 X33.338 Y30.256 E.01654
G1 X31.304 Y32.29 E.08881
G1 X31.304 Y31.755 E.01654
G1 X32.802 Y30.256 E.06542
G1 X32.266 Y30.256 E.01654
G1 X31.304 Y31.219 E.04202
G1 X31.304 Y30.683 E.01654
G1 X31.9 Y30.087 E.02603
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X31.304 Y30.683 E-.32045
G1 X31.304 Y31.219 E-.20361
G1 X31.743 Y30.78 E-.23595
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 99/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z20 I-.858 J.863 P1  F30000
G1 X48.138 Y47.091 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8026
G1 X30.971 Y47.091 E.56948
G1 X30.971 Y29.923 E.56948
G1 X48.138 Y29.923 E.56948
G1 X48.138 Y47.031 E.56749
G1 X48.545 Y47.498 F30000
G1 F8026
G1 X30.563 Y47.498 E.59649
G1 X30.563 Y29.516 E.59649
G1 X48.545 Y29.516 E.59649
G1 X48.545 Y47.438 E.5945
G1 X48.952 Y47.905 F30000
G1 F8026
G1 X30.156 Y47.905 E.62349
G1 X30.156 Y29.109 E.62349
G1 X48.952 Y29.109 E.62349
G1 X48.952 Y47.845 E.6215
G1 X49.344 Y48.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8026
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X47.344 Y48.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.621 Y40.616 Z20.2 F30000
G1 X47.974 Y30.853 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421796
G1 F8026
G1 X47.378 Y30.256 E.02604
G1 X46.842 Y30.256 E.01654
G1 X47.805 Y31.219 E.04203
G1 X47.805 Y31.755 E.01654
G1 X46.306 Y30.256 E.06542
G1 X45.771 Y30.256 E.01654
G1 X47.805 Y32.29 E.08881
G1 X47.805 Y32.826 E.01654
G1 X45.235 Y30.256 E.11221
G1 X44.699 Y30.256 E.01654
G1 X47.805 Y33.362 E.1356
G1 X47.805 Y33.898 E.01654
G1 X44.163 Y30.256 E.159
G1 X43.627 Y30.256 E.01654
G1 X47.805 Y34.434 E.18239
G1 X47.805 Y34.97 E.01654
G1 X43.092 Y30.256 E.20579
G1 X42.556 Y30.256 E.01654
G1 X47.805 Y35.505 E.22918
G1 X47.805 Y36.041 E.01654
G1 X42.02 Y30.256 E.25258
G1 X41.484 Y30.256 E.01654
G1 X47.805 Y36.577 E.27597
G1 X47.805 Y37.113 E.01654
G1 X40.948 Y30.256 E.29937
G1 X40.413 Y30.256 E.01654
G1 X47.805 Y37.649 E.32276
G1 X47.805 Y38.184 E.01654
G1 X39.877 Y30.256 E.34615
G1 X39.341 Y30.256 E.01654
G1 X47.805 Y38.72 E.36955
G1 X47.805 Y39.256 E.01654
G1 X38.805 Y30.256 E.39294
G1 X38.269 Y30.256 E.01654
G1 X47.805 Y39.792 E.41634
G1 X47.805 Y40.328 E.01654
G1 X37.733 Y30.256 E.43973
G1 X37.198 Y30.256 E.01654
G1 X47.805 Y40.863 E.46313
G1 X47.805 Y41.399 E.01654
G1 X36.662 Y30.256 E.48652
G1 X36.126 Y30.256 E.01654
G1 X47.805 Y41.935 E.50992
G1 X47.805 Y42.471 E.01654
G1 X35.59 Y30.256 E.53331
G1 X35.054 Y30.256 E.01654
G1 X47.805 Y43.007 E.55671
G1 X47.805 Y43.543 E.01654
G1 X34.519 Y30.256 E.5801
G1 X33.983 Y30.256 E.01654
G1 X47.805 Y44.078 E.60349
G1 X47.805 Y44.614 E.01654
G1 X33.447 Y30.256 E.62689
G1 X32.911 Y30.256 E.01654
G1 X47.805 Y45.15 E.65028
G1 X47.805 Y45.686 E.01654
G1 X32.375 Y30.256 E.67368
G1 X31.84 Y30.256 E.01654
G1 X47.805 Y46.222 E.69707
G1 X47.805 Y46.757 E.01654
G1 X31.304 Y30.256 E.72046
G1 X31.304 Y30.792 E.01654
G1 X47.269 Y46.757 E.69707
G1 X46.733 Y46.757 E.01654
G1 X31.304 Y31.328 E.67367
G1 X31.304 Y31.864 E.01654
G1 X46.197 Y46.757 E.65028
G1 X45.661 Y46.757 E.01654
G1 X31.304 Y32.4 E.62688
G1 X31.304 Y32.935 E.01654
G1 X45.126 Y46.757 E.60349
G1 X44.59 Y46.757 E.01654
G1 X31.304 Y33.471 E.58009
G1 X31.304 Y34.007 E.01654
G1 X44.054 Y46.757 E.5567
G1 X43.518 Y46.757 E.01654
G1 X31.304 Y34.543 E.53331
G1 X31.304 Y35.079 E.01654
G1 X42.982 Y46.757 E.50991
M73 P97 R0
G1 X42.447 Y46.757 E.01654
G1 X31.304 Y35.615 E.48652
G1 X31.304 Y36.15 E.01654
G1 X41.911 Y46.757 E.46312
G1 X41.375 Y46.757 E.01654
G1 X31.304 Y36.686 E.43973
G1 X31.304 Y37.222 E.01654
G1 X40.839 Y46.757 E.41633
G1 X40.303 Y46.757 E.01654
G1 X31.304 Y37.758 E.39294
G1 X31.304 Y38.294 E.01654
G1 X39.768 Y46.757 E.36954
G1 X39.232 Y46.757 E.01654
G1 X31.304 Y38.829 E.34615
G1 X31.304 Y39.365 E.01654
G1 X38.696 Y46.757 E.32276
G1 X38.16 Y46.757 E.01654
G1 X31.304 Y39.901 E.29936
G1 X31.304 Y40.437 E.01654
G1 X37.624 Y46.757 E.27597
G1 X37.089 Y46.757 E.01654
G1 X31.304 Y40.973 E.25257
G1 X31.304 Y41.508 E.01654
G1 X36.553 Y46.757 E.22918
G1 X36.017 Y46.757 E.01654
G1 X31.304 Y42.044 E.20578
G1 X31.304 Y42.58 E.01654
G1 X35.481 Y46.757 E.18239
G1 X34.945 Y46.757 E.01654
G1 X31.304 Y43.116 E.15899
G1 X31.304 Y43.652 E.01654
G1 X34.409 Y46.757 E.1356
G1 X33.874 Y46.757 E.01654
G1 X31.304 Y44.188 E.1122
G1 X31.304 Y44.723 E.01654
G1 X33.338 Y46.757 E.08881
G1 X32.802 Y46.757 E.01654
G1 X31.304 Y45.259 E.06542
G1 X31.304 Y45.795 E.01654
G1 X32.266 Y46.757 E.04202
G1 X31.73 Y46.757 E.01654
G1 X31.134 Y46.161 E.02603
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X31.73 Y46.757 E-.32044
G1 X32.266 Y46.757 E-.20361
G1 X31.827 Y46.318 E-.23595
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; layer num/total_layer_count: 100/100
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; start printing object, unique label id: 109
M624 AQAAAAAAAAA=
G17
G3 Z20.2 I-.137 J1.209 P1  F30000
G1 X49.344 Y48.297 Z20.2
G1 Z20
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8706
G1 X29.764 Y48.297 E.60164
G1 X29.764 Y28.717 E.60164
G1 X49.344 Y28.717 E.60164
G1 X49.344 Y48.237 E.5998
M204 S10000
G1 X48.369 Y48.089 F30000
M204 S2000
; FEATURE: Top surface
G1 F8706
G1 X49.137 Y47.322 E.03335
G1 X49.137 Y46.789
G1 X47.836 Y48.089 E.05652
G1 X47.303 Y48.089
G1 X49.137 Y46.255 E.0797
G1 X49.137 Y45.722
G1 X46.77 Y48.089 E.10287
G1 X46.236 Y48.089
G1 X49.137 Y45.189 E.12604
G1 X49.137 Y44.656
G1 X45.703 Y48.089 E.14922
G1 X45.17 Y48.089
G1 X49.137 Y44.122 E.17239
G1 X49.137 Y43.589
G1 X44.637 Y48.089 E.19556
G1 X44.103 Y48.089
G1 X49.137 Y43.056 E.21874
G1 X49.137 Y42.523
G1 X43.57 Y48.089 E.24191
G1 X43.037 Y48.089
G1 X49.137 Y41.989 E.26508
G1 X49.137 Y41.456
G1 X42.503 Y48.089 E.28825
G1 X41.97 Y48.089
G1 X49.137 Y40.923 E.31143
G1 X49.137 Y40.389
G1 X41.437 Y48.089 E.3346
G1 X40.904 Y48.089
G1 X49.137 Y39.856 E.35777
G1 X49.137 Y39.323
G1 X40.37 Y48.089 E.38095
G1 X39.837 Y48.089
G1 X49.137 Y38.79 E.40412
G1 X49.137 Y38.256
G1 X39.304 Y48.089 E.42729
G1 X38.771 Y48.089
G1 X49.137 Y37.723 E.45047
G1 X49.137 Y37.19
G1 X38.237 Y48.089 E.47364
G1 X37.704 Y48.089
G1 X49.137 Y36.657 E.49681
G1 X49.137 Y36.123
G1 X37.171 Y48.089 E.51999
G1 X36.637 Y48.089
G1 X49.137 Y35.59 E.54316
G1 X49.137 Y35.057
G1 X36.104 Y48.089 E.56633
G1 X35.571 Y48.089
G1 X49.137 Y34.524 E.58951
G1 X49.137 Y33.99
G1 X35.038 Y48.089 E.61268
G1 X34.504 Y48.089
G1 X49.137 Y33.457 E.63585
G1 X49.137 Y32.924
G1 X33.971 Y48.089 E.65903
G1 X33.438 Y48.089
G1 X49.137 Y32.39 E.6822
G1 X49.137 Y31.857
G1 X32.905 Y48.089 E.70537
G1 X32.371 Y48.089
G1 X49.137 Y31.324 E.72855
G1 X49.137 Y30.791
G1 X31.838 Y48.089 E.75172
G1 X31.305 Y48.089
G1 X49.137 Y30.257 E.77489
G1 X49.137 Y29.724
G1 X30.772 Y48.089 E.79806
G1 X30.238 Y48.089
G1 X49.137 Y29.191 E.82124
G1 X48.87 Y28.924
G1 X29.972 Y47.823 E.82123
G1 X29.972 Y47.289
G1 X48.337 Y28.924 E.79806
G1 X47.804 Y28.924
G1 X29.972 Y46.756 E.77489
G1 X29.972 Y46.223
G1 X47.27 Y28.924 E.75171
G1 X46.737 Y28.924
G1 X29.972 Y45.69 E.72854
G1 X29.972 Y45.156
G1 X46.204 Y28.924 E.70537
G1 X45.671 Y28.924
G1 X29.972 Y44.623 E.68219
G1 X29.972 Y44.09
G1 X45.137 Y28.924 E.65902
G1 X44.604 Y28.924
G1 X29.972 Y43.557 E.63585
G1 X29.972 Y43.023
G1 X44.071 Y28.924 E.61267
G1 X43.537 Y28.924
G1 X29.972 Y42.49 E.5895
M73 P98 R0
G1 X29.972 Y41.957
G1 X43.004 Y28.924 E.56633
G1 X42.471 Y28.924
G1 X29.972 Y41.424 E.54315
G1 X29.972 Y40.89
G1 X41.938 Y28.924 E.51998
G1 X41.404 Y28.924
G1 X29.972 Y40.357 E.49681
G1 X29.972 Y39.824
G1 X40.871 Y28.924 E.47363
G1 X40.338 Y28.924
G1 X29.972 Y39.29 E.45046
G1 X29.972 Y38.757
G1 X39.805 Y28.924 E.42729
G1 X39.271 Y28.924
G1 X29.972 Y38.224 E.40411
G1 X29.972 Y37.691
G1 X38.738 Y28.924 E.38094
G1 X38.205 Y28.924
G1 X29.972 Y37.157 E.35777
G1 X29.972 Y36.624
G1 X37.672 Y28.924 E.3346
G1 X37.138 Y28.924
G1 X29.972 Y36.091 E.31142
G1 X29.972 Y35.558
G1 X36.605 Y28.924 E.28825
G1 X36.072 Y28.924
G1 X29.972 Y35.024 E.26508
G1 X29.972 Y34.491
G1 X35.538 Y28.924 E.2419
G1 X35.005 Y28.924
G1 X29.972 Y33.958 E.21873
G1 X29.972 Y33.424
G1 X34.472 Y28.924 E.19556
G1 X33.939 Y28.924
G1 X29.972 Y32.891 E.17238
G1 X29.972 Y32.358
G1 X33.405 Y28.924 E.14921
G1 X32.872 Y28.924
G1 X29.972 Y31.825 E.12604
G1 X29.972 Y31.291
G1 X32.339 Y28.924 E.10286
G1 X31.806 Y28.924
G1 X29.972 Y30.758 E.07969
G1 X29.972 Y30.225
G1 X31.272 Y28.924 E.05652
G1 X30.739 Y28.924
G1 X29.972 Y29.692 E.03334
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X30.739 Y28.924 E-.41236
G1 X31.272 Y28.924 E-.20264
G1 X31.002 Y29.194 E-.145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z20.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z120 F600
    G1 Z118

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

