#include <U8glib.h>
#include <AccelStepper.h>

// LCD Display Setup
U8GLIB_ST7920_128X64_1X u8g(23, 17, 16); // Adjust these pin numbers to match your setup

// Stepper Motor Setup
#define motorInterfaceType 1
AccelStepper stepperX(motorInterfaceType, 54, 55); // X-axis stepper
AccelStepper stepperY(motorInterfaceType, 60, 61); // Y-axis stepper
AccelStepper stepperZ(motorInterfaceType, 46, 48); // Z-axis stepper
AccelStepper extruderStepper(motorInterfaceType, 26, 28); // Extruder stepper

// Heated Bed and Hotend Setup
const int bedHeaterPin = 8; // Heated bed control pin
const int hotendHeaterPin = 10; // Hotend heater control pin
const int bedThermistorPin = A15; // Heated bed thermistor pin
const int hotendThermistorPin = A13; // Hotend thermistor pin

// Target Temperatures
int bedTargetTemperature = 0;
int hotendTargetTemperature = 0;

void setup() {
  Serial.begin(115200); // Initialize serial communication
  setupSteppers(); // Initialize stepper motors
  pinMode(bedHeaterPin, OUTPUT);
  pinMode(hotendHeaterPin, OUTPUT);
  displayMessage("3D Printer Ready", "");
}

void loop() {
  if (Serial.available() > 0) {
    String gCodeCommand = Serial.readStringUntil('\n');
    interpretGCode(gCodeCommand);
  }
  updateTemperatures(); // Control temperatures
  runSteppers(); // Process stepper movements
}

void setupSteppers() {
  // Configure initial speeds and accelerations for the stepper motors
  stepperX.setMaxSpeed(1000);
  stepperX.setAcceleration(500);
  stepperY.setMaxSpeed(1000);
  stepperY.setAcceleration(500);
  stepperZ.setMaxSpeed(500);
  stepperZ.setAcceleration(250);
  extruderStepper.setMaxSpeed(1000);
  extruderStepper.setAcceleration(500);
}

void interpretGCode(String command) {
  // Basic interpretation of G-code commands for movement and temperature settings
  // Example for basic movement command (G1 with X, Y, Z, and E parameters)
  if (command.startsWith("G1")) {
    if (command.indexOf("X") != -1) stepperX.moveTo(parseCommandValue(command, 'X') * 100); // Example step/mm conversion
    if (command.indexOf("Y") != -1) stepperY.moveTo(parseCommandValue(command, 'Y') * 100);
    if (command.indexOf("Z") != -1) stepperZ.moveTo(parseCommandValue(command, 'Z') * 100);
    if (command.indexOf("E") != -1) extruderStepper.moveTo(parseCommandValue(command, 'E') * 100); // Adjust for your extruder setup
  }
  // Setting the target bed temperature (M140 Sxx)
  if (command.startsWith("M140")) {
    bedTargetTemperature = parseCommandValue(command, 'S');
  }
  // Setting the target hotend temperature (M104 Sxx)
  if (command.startsWith("M104")) {
    hotendTargetTemperature = parseCommandValue(command, 'S');
  }
}

void updateTemperatures() {
  // Function for controlling the heated bed and hotend temperatures
  // Includes reading thermistor values, calculating temperatures, and applying control logic
  controlHeatedBed();
  controlHotend();
}

void controlHeatedBed() {
  // Simple bang-bang control for the heated bed
  int bedTemperature = readTemperature(bedThermistorPin);
  if (bedTemperature < bedTargetTemperature - 1) {
    digitalWrite(bedHeaterPin, HIGH);
  } else if (bedTemperature > bedTargetTemperature) {
    digitalWrite(bedHeaterPin, LOW);
  }
}

void controlHotend() {
  // Simple bang-bang control for the hotend
  int hotendTemperature = readTemperature(hotendThermistorPin);
  if (hotendTemperature < hotendTargetTemperature - 1) {
    digitalWrite(hotendHeaterPin, HIGH);
  } else if (hotendTemperature > hotendTargetTemperature) {
    digitalWrite(hotendHeaterPin, LOW);
  }
}

int readTemperature(int thermistorPin) {
  const float BETA = 3950.0; // Beta parameter for your thermistor
  const float T0 = 298.15; // Room temperature in Kelvin (25°C = 298.15K)
  const float R0 = 10000.0; // Resistance of your thermistor at 25°C
  const float R_SERIES = 10000.0; // Resistance of the series resistor

  // Read the analog value from the thermistor
  int analogValue = analogRead(thermistorPin);

  // Convert the analog reading (which goes from 0 - 1023) to a resistance
  float resistance = (1023.0 / analogValue) - 1;
  resistance = R_SERIES / resistance;

  // Convert the resistance to temperature using the Beta parameter equation
  float temperatureK = BETA / (log(resistance / R0) + (BETA / T0));
  float temperatureC = temperatureK - 273.15; // Convert Kelvin to Celsius

  return (int)temperatureC; // Return the temperature as an integer
}


void runSteppers() {
  // Continuously run stepper motors based on the interpreted G-code commands
  stepperX.run();
  stepperY.run();
  stepperZ.run();
  extruderStepper.run();
}

void displayMessage(String line1, String line2) {
  // Function to display messages on the LCD
  u8g.firstPage();
  do {
    u8g.setFont(u8g_font_6x10); // Choose a suitable font
    u8g.drawStr(0, 20, line1.c_str()); // Display the first line
    u8g.drawStr(0, 32, line2.c_str()); // Display the second line
  } while (u8g.nextPage());
}

float parseCommandValue(String command, char key) {
  // Function to extract numerical values from G-code commands
  int keyIndex = command.indexOf(key);
  if (keyIndex != -1 && keyIndex + 1 < command.length()) {
    int spaceIndex = command.indexOf(' ', keyIndex + 1);
    if (spaceIndex == -1) spaceIndex = command.length();
    return command.substring(keyIndex + 1, spaceIndex).toFloat();
  }
  return 0;
}
