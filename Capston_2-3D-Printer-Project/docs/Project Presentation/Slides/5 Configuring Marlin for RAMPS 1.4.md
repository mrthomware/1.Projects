### Presentation Outline: Configuring Marlin Firmware for RAMPS 1.4

#### 5. Configuring Marlin for RAMPS 1.4 (3 minutes)
- **Motherboard Selection**:
  - Editing `Configuration.h`.
  - Setting `MOTHERBOARD` to `BOARD_RAMPS_14_EFB`.
- **Stepper Drivers**:
  - Configuring stepper driver types, if not using standard A4988.
- **Thermistors**:
  - Setting thermistor types for accurate temperature readings.
- **Endstops**:
  - Configuring endstops for minimum and maximum travel.
- **Feature Activation**:
  - Examples: Auto bed leveling, thermal runaway protection.

Configuring Marlin firmware for use with a RAMPS 1.4 setup involves specific edits to the `Configuration.h` file. These edits allow the firmware to understand how the printer is built and how it should control the hardware. Here’s a guide to making some of the essential configurations:

### Motherboard Selection

The first step is to specify that you are using a RAMPS 1.4 board. This helps Marlin initialize the correct pin assignments for the various functions and components.

- **Open `Configuration.h`**: This file is located in the Marlin folder you extracted earlier.
- **Set `MOTHERBOARD`**:
  - Search for `#define MOTHERBOARD` and change its value to `BOARD_RAMPS_14_EFB`.
  - `BOARD_RAMPS_14_EFB` is a common configuration where E stands for Extruder, F for Fan, and B for Bed, indicating the control outputs used on the RAMPS.

### Stepper Drivers

If you are using stepper drivers other than the common A4988, you need to specify this to ensure Marlin properly controls these drivers.

- **Locate Stepper Driver Settings**:
  - Find the section in `Configuration.h` where stepper drivers are defined. This usually starts with `#define X_DRIVER_TYPE`, `#define Y_DRIVER_TYPE`, etc.
- **Edit Driver Types**:
  - Change each `DRIVER_TYPE` to match the drivers you are using, such as `DRV8825`, `TMC2208`, etc.

### Thermistors

Proper thermistor settings are crucial for accurate temperature readings, which affect printing quality and safety.

- **Set Thermistor Types**:
  - Locate the thermistor settings for the hotend and bed, typically `#define TEMP_SENSOR_0` for the first hotend and `#define TEMP_SENSOR_BED` for the bed.
  - Set these to the number that corresponds to your thermistor type, which is usually documented in the Marlin comments or your thermistor's datasheet.

### Endstops

Configuring endstops ensures that the printer recognizes its physical boundaries and does not move beyond them, preventing damage.

- **Configure Endstops**:
  - Find the endstop configurations in `Configuration.h`, indicated by `#define USE_XMIN_PLUG` and similar for other axes.
  - Make sure these are set to `true` or `false` depending on whether you have endstops installed at these positions.
  - Additionally, configure the logic of these endstops (`true` if triggered means stop; `false` if triggered means continue) depending on your mechanical setup.

### Feature Activation

Activating specific features like auto bed leveling and thermal runaway protection enhances both the functionality and safety of your printer.

- **Auto Bed Leveling**:
  - To enable, find and uncomment `#define AUTO_BED_LEVELING_UBL`, `#define AUTO_BED_LEVELING_BILINEAR`, or another suitable leveling system.
  - Follow additional instructions in the comments for setting up the probing grid and other related settings.
- **Thermal Runaway Protection**:
  - Ensure this safety feature is enabled by checking that `#define THERMAL_RUNAWAY_PROTECTION_PERIOD` and `#define THERMAL_RUNAWAY_PROTECTION_HYSTERESIS` are uncommented and set to reasonable values (usually defaults are good).

Once these configurations are set, you should review all settings to ensure they match your hardware specifications and needs. After making the necessary adjustments, you'll be ready to compile and upload the firmware to your 3D printer controller. This preparation will guide the printer in performing according to the specific configurations of your RAMPS 1.4 setup, enhancing both its performance and safety.
