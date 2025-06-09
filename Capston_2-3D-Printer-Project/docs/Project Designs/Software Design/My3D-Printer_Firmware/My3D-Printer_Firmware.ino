#include <U8glib.h>
#include <AccelStepper.h>

// LCD Display Setup
U8GLIB_ST7920_128X64_1X u8g(23, 17, 16); // Example pins, adjust to match your setup

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
  displayMessage("3D Printer Ready");
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
  // Example for basic movement command (G1 with X, Y, Z, and E parameters)
  if (command.startsWith("G1")) {
    if (command.indexOf("X") != -1) stepperX.moveTo(parseCommandValue(command, 'X') * 100); // Example step/mm conversion
    if (command.indexOf("Y") != -1) stepperY.moveTo(parseCommandValue(command, 'Y') * 100);
    if (command.indexOf("Z") != -1) stepperZ.moveTo(parseCommandValue(command, 'Z') * 100);
    if (command.indexOf("E") != -1) extruderStepper.moveTo(parseCommandValue(command, 'E') * 100); // Adjust for your extruder
  }

  // Example for setting the target bed temperature (M140 Sxx)
  if (command.startsWith("M140")) {
    bedTargetTemperature = parseCommandValue(command, 'S');
  }

  // Example for setting the target hotend temperature (M104 Sxx)
  if (command.startsWith("M104")) {
    hotendTargetTemperature = parseCommandValue(command, 'S');
  }
}

void updateTemperatures() {
  const float betaCoefficient = 3950.0; // Common value for many thermistors
  const float roomTempResistance = 10000.0; // Resistance at 25 degrees Celsius
  const float roomTemperature = 25.0 + 273.15; // Room temperature in Kelvin
  const float seriesResistor = 4700.0; // Value of the series resistor

  // Read thermistor values
  int rawBedTemp = analogRead(bedThermistorPin);
  int rawHotendTemp = analogRead(hotendThermistorPin);

  // Convert analog readings to resistance
  float bedResistance = seriesResistor / ((1023.0 / rawBedTemp) - 1);
  float hotendResistance = seriesResistor / ((1023.0 / rawHotendTemp) - 1);

  // Convert resistance to temperature using the Beta equation
  float bedTemperature = betaCoefficient / (log(bedResistance / roomTempResistance) + (betaCoefficient / roomTemperature)) - 273.15;
  float hotendTemperature = betaCoefficient / (log(hotendResistance / roomTempResistance) + (betaCoefficient / roomTemperature)) - 273.15;

  // Simple bang-bang controller for the heated bed
  if (bedTemperature < bedTargetTemperature - 1) { // -1 to create a hysteresis effect
    digitalWrite(bedHeaterPin, HIGH);
  } else if (bedTemperature > bedTargetTemperature) {
    digitalWrite(bedHeaterPin, LOW);
  }

  // Simple bang-bang controller for the hotend
  if (hotendTemperature < hotendTargetTemperature - 1) { // -1 to create a hysteresis effect
    digitalWrite(hotendHeaterPin, HIGH);
  } else if (hotendTemperature > hotendTargetTemperature) {
    digitalWrite(hotendHeaterPin, LOW);
  }

  // Optionally, update the LCD with the current temperatures
  // Uncomment and implement if you wish to display temperatures on the LCD
  // displayMessage("Bed: " + String(bedTemperature) + "C Hotend: " + String(hotendTemperature) + "C");
}


void runSteppers() {
  stepperX.run();
  stepperY.run();
  stepperZ.run();
  extruderStepper.run();
}

void displayMessage(String message) {
  u8g.firstPage();
  do {
    u8g.setFont(u8g_font_6x10);
    u8g.drawStr(0, 20, message.c_str());
  } while (u8g.nextPage());
}

float parseCommandValue(String command, char key) {
  int keyIndex = command.indexOf(key);
  if (keyIndex != -1 && keyIndex + 1 < command.length()) {
    int spaceIndex = command.indexOf(' ', keyIndex + 1);
    if (spaceIndex == -1) spaceIndex = command.length();
    return command.substring(keyIndex + 1, spaceIndex).toFloat();
  }
  return 0;
}
