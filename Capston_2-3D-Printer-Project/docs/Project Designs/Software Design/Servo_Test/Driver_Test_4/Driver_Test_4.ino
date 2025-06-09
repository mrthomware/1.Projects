
#include <AccelStepper.h>
 
#define dirPin 2
#define stepPin 3
#define motorInterfaceType 1
 
// Create a new instance of the AccelStepper class:
AccelStepper stepper = AccelStepper(motorInterfaceType, stepPin, dirPin);
 
void setup() 
{
  // Set the maximum speed and acceleration:
  stepper.setMaxSpeed(200);
  stepper.setAcceleration(30);
}
 
void loop() {
  // Set the target position:
  stepper.moveTo(600);
  // Run to target position with set speed and acceleration/deceleration:
  stepper.runToPosition();
 
  delay(1000);
 
  // Move back to zero:
  stepper.moveTo(0);
  stepper.runToPosition();
 
  delay(1000);
}