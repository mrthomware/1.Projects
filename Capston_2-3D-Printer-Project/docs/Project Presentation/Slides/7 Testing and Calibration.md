### Presentation Outline: Configuring Marlin Firmware for RAMPS 1.4

#### 7. Testing and Calibration (1 minute)
- Initial checks after firmware upload.
- Calibration processes: bed leveling, step per mm settings.
- Tips on test printing to ensure settings are correct.

After uploading the Marlin firmware to your 3D printer, conducting initial checks and calibration is crucial to ensure optimal printer performance. Here’s a structured approach to testing and calibrating your printer:

### Initial Checks After Firmware Upload

1. **Basic Functionality Test**:
   - Power on the printer and ensure that the control interface (LCD screen, if available) is functioning.
   - Navigate through the menu to confirm that all options are accessible and the display is behaving as expected.

2. **Motor Movement Check**:
   - Use the printer’s control panel or a connected host software (like Pronterface) to move each axis slightly via the manual controls. Ensure each motor responds correctly and moves in the correct direction.
   - If any axis moves in the wrong direction, you will need to invert the motor direction in the firmware by changing the respective `INVERT_X_DIR`, `INVERT_Y_DIR`, or `INVERT_Z_DIR` settings in `Configuration.h`.

3. **Heating Check**:
   - Test the heating capability of the hotend and heated bed (if equipped). Set a target temperature (e.g., 200°C for the hotend and 60°C for the bed) and ensure they reach and maintain the set temperatures without errors.

4. **Endstop Check**:
   - Manually trigger each endstop switch during a home command to make sure the movement stops. This confirms that the endstops are correctly configured and functional.

### Calibration Processes

#### Bed Leveling

1. **Manual Bed Leveling**:
   - If your printer lacks an automatic bed leveling sensor, you'll need to manually level the bed by adjusting the bed screws while measuring the nozzle distance from the bed at several points.

2. **Automatic Bed Leveling**:
   - If equipped, configure and enable your auto-bed leveling sensor in Marlin via `Configuration.h` and `Configuration_adv.h`. Run the auto-leveling process from the printer’s menu or using a G-code command (usually `G29`).

#### Step Per MM Settings

1. **Calibrate Axis Movement**:
   - Measure a set distance that each axis should move (e.g., 100 mm), command the printer to move that distance, and then measure the actual movement. Adjust the `DEFAULT_AXIS_STEPS_PER_UNIT` in `Configuration.h` if there’s a discrepancy.

2. **Extruder Calibration**:
   - Mark 120 mm on filament leading into the extruder and command the printer to extrude 100 mm. Measure the remaining filament length to see if exactly 20 mm remains. Adjust the extruder steps per mm if necessary.

### Tips on Test Printing

1. **Print a Test Object**:
   - Start with a simple object like a calibration cube or a benchy. These models are designed to test accuracy, overhangs, and other aspects of print quality.

2. **Evaluate Print Quality**:
   - Check the first layer for good adhesion and uniformity.
   - Look for issues like stringing, oozing, or under-extrusion in your print, which could indicate that further tuning of temperature, retraction settings, or extrusion multiplier is needed.

3. **Fine-Tune Settings**:
   - Based on the test print, tweak the printer settings. Adjust temperatures, print speeds, and cooling settings to achieve the best print quality.

By methodically going through these checks and calibration steps, you can ensure that your 3D printer operates efficiently and produces high-quality prints. Regular calibration and maintenance are key to sustaining the printer’s performance.