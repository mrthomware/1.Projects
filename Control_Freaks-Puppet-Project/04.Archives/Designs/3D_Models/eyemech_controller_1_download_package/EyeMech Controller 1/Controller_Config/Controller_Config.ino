//  Nilheim Mechatronics Eye Mechanism Controller Configuration
//  Use serial monitor and/or plotter to check functionality of the controller
//  X axis: A1, Y axis: A0, Trim Pot: A2, Button: 2


const int buttonPin = 2;     // the number of the pushbutton pin
const int ledPin =  13;      // the number of the LED pin

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

void setup() {
    Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  int poto= map(analogRead(A2),350,700,0,100);
  int potx= map(analogRead(A1),0,1023,0,100);
  int poty= map(analogRead(A0),0,1023,0,100);
  Serial.print(buttonState);
  Serial.print("     open Pot: ");
  Serial.print(poto);
  Serial.print("     x pot: ");
    Serial.print(potx);
      Serial.print("     y pot: ");
          Serial.println(poty);
 


  
}
