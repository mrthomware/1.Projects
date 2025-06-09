#include <Stepper.h>

// Define the number of steps per revolution for your stepper motor.
const int stepsPerRevolution = 200;

// Initialize the stepper library for the X, Y, and Z axis.
Stepper stepperX(stepsPerRevolution, 2, 3, 4, 5); // Example pins for the X stepper motor
Stepper stepperY(stepsPerRevolution, 6, 7, 8, 9); // Example pins for the Y stepper motor
Stepper stepperZ(stepsPerRevolution, 10, 11, 12, 13); // Example pins for the Z stepper motor

void setup() {
  Serial.begin(115200); // Start serial communication at 115200 bps.
}

void loop() {
  if (Serial.available() > 0) {
    String gCodeCommand = Serial.readStringUntil('\n'); // Read the incoming G-code command.
    interpretGCode(gCodeCommand); // Interpret the G-code command.
  }
}

void interpretGCode(String command) {
  // Example: G1 X10 Y10 Z-5 F1500
  // Split the command by spaces to analyze its components.
  int xPos = command.indexOf('X');
  int yPos = command.indexOf('Y');
  int zPos = command.indexOf('Z');
  int fPos = command.indexOf('F');

  int xSteps = 0, ySteps = 0, zSteps = 0; // Steps for motors to move.

  if (xPos > -1) {
    xSteps = extractValue(command, xPos + 1); // Extract the value for the X coordinate.
  }
  if (yPos > -1) {
    ySteps = extractValue(command, yPos + 1); // Extract the value for the Y coordinate.
  }
  if (zPos > -1) {
    zSteps = extractValue(command, zPos + 1); // Extract the value for the Z coordinate.
  }

  // Convert coordinates to steps for the motors and perform the movement.
  moveStepper(stepperX, xSteps);
  moveStepper(stepperY, ySteps);
  moveStepper(stepperZ, zSteps);
}

void moveStepper(Stepper &stepper, int steps) {
  if (steps != 0) {
    stepper.step(steps);
  }
}

int extractValue(String command, int start) {
  int spacePos = command.indexOf(' ', start);
  if (spacePos == -1) spacePos = command.length(); // If no space found, use end of the command.
  return command.substring(start, spacePos).toInt(); // Extract and convert the value to integer.
}
