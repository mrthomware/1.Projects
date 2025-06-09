#include <Arduino.h>
#include "A4988.h"
 
int Step = 3; //GPIO3 in Arduino UNO --- Step of stepper motor driver
int Dire  = 2; //GPIO2 in Arduino UNO --- Direction of stepper motor driver
int Sleep = 4; //GPIO4 in Arduino UNO --- Control Sleep Mode on A4988
int MS1 = 7; //GPIO7 in Arduino UNO --- MS1 for A4988
int MS2 = 6; //GPIO6 in Arduino UNO --- MS2 for A4988
int MS3 = 5; //GPIO5 in Arduino UNO --- MS3 for A4988
 
//Motor Specs
const int spr = 200; //Steps per revolution
int RPM = 1; //Motor Speed in revolutions per minute - Here we set the RPM to 1 rpm to match the speed of second hand from a clock
int Microsteps = 16; //Stepsize (1 for full steps, 2 for half steps, 4 for quarter steps, etc)
 
//Providing parameters for motor control
A4988 stepper(spr, Dire, Step, MS1, MS2, MS3);
 
void setup() {
  Serial.begin(9600);
  pinMode(Step, OUTPUT); //Step pin as output
  pinMode(Dire,  OUTPUT); //Direcction pin as output
  pinMode(Sleep,  OUTPUT); //Set Sleep OUTPUT Control button as output
  digitalWrite(Step, LOW); // Currently no stepper motor movement
  digitalWrite(Dire, LOW);
  
  // Set target motor RPM to and microstepping setting
  stepper.begin(RPM, Microsteps);
}
 
void loop() {
    digitalWrite(Sleep, HIGH); //A logic high allows normal operation of the A4988 by removing from sleep
    stepper.rotate(360);
}