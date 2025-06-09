// Define stepper motor connections for RAMPS 1.4 X-axis
const int stepPin = 54; // X-axis STEP pin on RAMPS 1.4
const int dirPin = 55;  // X-axis DIR pin on RAMPS 1.4
const int stepsPerRevolution = 200; // Adjust this value based on your stepper motor's specifications

void setup() {
  // Set the motor pins as outputs
  pinMode(stepPin, OUTPUT);
  pinMode(dirPin, OUTPUT);
}

void loop() {
  // Set the spinning direction clockwise
  digitalWrite(dirPin, HIGH);
  // Spin the stepper motor 1 revolution slowly
  for(int i = 0; i < stepsPerRevolution; i++) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(1000); // Adjust speed with this delay
    digitalWrite(stepPin, LOW);
    delayMicroseconds(1000); // Adjust speed with this delay
  }
  
  delay(1000); // Wait for 1 second

  // Set the spinning direction counterclockwise
  digitalWrite(dirPin, LOW);
  // Spin the stepper motor 1 revolution slowly
  for(int i = 0; i < stepsPerRevolution; i++) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(1000); // Adjust speed with this delay
    digitalWrite(stepPin, LOW);
    delayMicroseconds(1000); // Adjust speed with this delay
  }
  
  delay(1000); // Wait for 1 second
}
