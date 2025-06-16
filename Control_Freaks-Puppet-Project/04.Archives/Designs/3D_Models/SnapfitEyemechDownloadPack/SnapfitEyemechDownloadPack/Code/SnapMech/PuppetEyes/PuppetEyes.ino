#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
#include <EEPROM.h>

// ------------------ PCA9685 Setup ------------------
#define PCA9685_I2C_ADDR 0x40
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(PCA9685_I2C_ADDR);

#define SERVO_FREQ 50
#define SERVOMIN   150
#define SERVOMAX   600

// ------------------ Servo Channels ------------------
const uint8_t CH_LOOKLR = 0; // Eye left-right
const uint8_t CH_LOOKUD = 1; // Eye up-down
const uint8_t CH_LIDBL  = 2; // Lid bottom-left
const uint8_t CH_LIDTL  = 3; // Lid top-left
const uint8_t CH_LIDBR  = 4; // Lid bottom-right
const uint8_t CH_LIDTR  = 5; // Lid top-right

// Current angles in RAM, also mirrored in EEPROM
int servoAngles[6] = {90,90,90,90,90,90};

// We'll store the "startup" angles here for the Home button.
int startAngles[6] = {90,90,90,90,90,90};

// EEPROM addresses (we write if angle changes in setServoAngle())
const int EEPROM_LOOKLR = 0;
const int EEPROM_LOOKUD = 1;
const int EEPROM_LIDBL  = 2;
const int EEPROM_LIDTL  = 3;
const int EEPROM_LIDBR  = 4;
const int EEPROM_LIDTR  = 5;

// ------------------ Arduino Pins ------------------
// Blink button on pin 7
int blinkButPin   = 7;
// Home button on pin 4
int homeButPin    = 4;
// Joystick
int UDPin         = A0;
int LRPin         = A1;

// Variables for the joystick
int UDState       = 90;
int LRState       = 90;
int lidMod        = 0;

// For button states
int blinkButtonState;
int lastBlinkButtonState = HIGH;
int homeButtonState;
int lastHomeButtonState = HIGH;

// We'll compute normal eyelid angles in loop
int lidBLangle, lidTLangle, lidBRangle, lidTRangle;

// -----------------------------------------------------------------------------
// Write angle to PCA9685 & EEPROM if changed
// -----------------------------------------------------------------------------
void setServoAngle(uint8_t channel, int angle) {
  angle = constrain(angle, 0, 180);
  if (angle != servoAngles[channel]) {
    servoAngles[channel] = angle;
    EEPROM.write(channel, angle); // store
  }
  int pulseLen = map(angle, 0, 180, SERVOMIN, SERVOMAX);
  pwm.setPWM(channel, 0, pulseLen);
}

// -----------------------------------------------------------------------------
// Reads servo angles from EEPROM into servoAngles[], sets them on PCA9685
// -----------------------------------------------------------------------------
void initializeHomePosition() {
  for (uint8_t ch = 0; ch < 6; ch++) {
    int stored = EEPROM.read(ch); // 0..255
    if (stored < 0 || stored > 180) {
      stored = 90;
    }
    servoAngles[ch] = stored;
  }
  // Apply them to the PCA9685
  for (uint8_t ch = 0; ch < 6; ch++) {
    int pulseLen = map(servoAngles[ch], 0, 180, SERVOMIN, SERVOMAX);
    pwm.setPWM(ch, 0, pulseLen);
  }
}

// -----------------------------------------------------------------------------
// Copy the current angles in servoAngles[] to startAngles[]
// This defines "home" as the angles right after program start
// -----------------------------------------------------------------------------
void storeStartupAnglesAsHome() {
  for (uint8_t i = 0; i < 6; i++) {
    startAngles[i] = servoAngles[i];
  }
}

// -----------------------------------------------------------------------------
// Move all servos to the stored "startup/home" angles
// -----------------------------------------------------------------------------
void goHomePositions() {
  Serial.println("Going to Home (startup) positions...");
  for (uint8_t i = 0; i < 6; i++) {
    setServoAngle(i, startAngles[i]);
  }
}

// -----------------------------------------------------------------------------
// Single Blink: close -> pause -> open
// -----------------------------------------------------------------------------
void blinkEyelids() {
  // Capture current (open) angles
  int blOpen = servoAngles[CH_LIDBL];
  int tlOpen = servoAngles[CH_LIDTL];
  int brOpen = servoAngles[CH_LIDBR];
  int trOpen = servoAngles[CH_LIDTR];

  // "Closed" angles
  int blClosed = 60;   // or adjust
  int tlClosed = 150;  
  int brClosed = 120;  
  int trClosed = 50;   

  // Animate open->closed
  int steps = 10;
  for (int i = 1; i <= steps; i++) {
    float t = (float)i / steps;
    setServoAngle(CH_LIDBL, blOpen + t*(blClosed - blOpen));
    setServoAngle(CH_LIDTL, tlOpen + t*(tlClosed - tlOpen));
    setServoAngle(CH_LIDBR, brOpen + t*(brClosed - brOpen));
    setServoAngle(CH_LIDTR, trOpen + t*(trClosed - trOpen));
    delay(15);
  }
  delay(150); // hold closed briefly

  // Animate closed->open
  int blNow = servoAngles[CH_LIDBL];
  int tlNow = servoAngles[CH_LIDTL];
  int brNow = servoAngles[CH_LIDBR];
  int trNow = servoAngles[CH_LIDTR];
  for (int i = 1; i <= steps; i++) {
    float t = (float)i / steps;
    setServoAngle(CH_LIDBL, blNow + t*(blOpen - blNow));
    setServoAngle(CH_LIDTL, tlNow + t*(tlOpen - tlNow));
    setServoAngle(CH_LIDBR, brNow + t*(brOpen - brNow));
    setServoAngle(CH_LIDTR, trNow + t*(trOpen - trNow));
    delay(15);
  }
}

// -----------------------------------------------------------------------------
void setup() {
  Serial.begin(9600);
  Serial.println("Starting Program: Using pin4 for Home, pin7 for Blink");

  pinMode(blinkButPin, INPUT_PULLUP);
  pinMode(homeButPin,  INPUT_PULLUP);

  Wire.begin();
  pwm.begin();
  pwm.setPWMFreq(SERVO_FREQ);

  // 1) Load angles from EEPROM
  initializeHomePosition();

  // 2) Immediately copy those angles to startAngles[] 
  //    => these become our "home" angles for the session
  storeStartupAnglesAsHome();

  Serial.println("Servo angles loaded from EEPROM and stored as 'home'.");
}

// -----------------------------------------------------------------------------
void loop() {
  // ========== 1) Check BLINK button (pin7) for single-blink logic ==========
  blinkButtonState = digitalRead(blinkButPin);
  if (lastBlinkButtonState == HIGH && blinkButtonState == LOW) {
    Serial.println("Blink button pressed => single blink...");
    blinkEyelids();
  }
  lastBlinkButtonState = blinkButtonState;

  // ========== 2) Check HOME button (pin4) to go to "startup/home" angles =========
  homeButtonState = digitalRead(homeButPin);
  if (lastHomeButtonState == HIGH && homeButtonState == LOW) {
    Serial.println("Home button pressed => going to 'startup' angles...");
    goHomePositions();
  }
  lastHomeButtonState = homeButtonState;

  // ========== 3) Joystick => Eye movement in real time ==========
  int rawUD = analogRead(UDPin);  
  int rawLR = analogRead(LRPin);

  UDState = map(rawUD, 0, 1023, 50, 130);
  LRState = map(rawLR, 0, 1023, 40, 140);

  setServoAngle(CH_LOOKUD, UDState);
  setServoAngle(CH_LOOKLR, LRState);

  // ========== 4) Eyelids => "open" angles by default (unless blinking) ==========
  lidMod     = (40 - UDState) / 2;
  lidBLangle = 160 + lidMod; 
  lidTLangle = 70  + lidMod;
  lidBRangle = 30  - lidMod;
  lidTRangle = 110 - lidMod;

  // Each loop, we set them open
  setServoAngle(CH_LIDBL, lidBLangle);
  setServoAngle(CH_LIDTL, lidTLangle);
  setServoAngle(CH_LIDBR, lidBRangle);
  setServoAngle(CH_LIDTR, lidTRangle);

  // ========== 5) Debug Output ==========
  Serial.print("blinkBut=");
  Serial.print(blinkButtonState==LOW ? "PRESSED" : "RELEASED");
  Serial.print(", homeBut=");
  Serial.print(homeButtonState==LOW ? "PRESSED" : "RELEASED");
  Serial.print(" || UD=");
  Serial.print(UDState);
  Serial.print(", LR=");
  Serial.print(LRState);
  Serial.print(" || BL=");
  Serial.print(servoAngles[CH_LIDBL]);
  Serial.print(", TL=");
  Serial.print(servoAngles[CH_LIDTL]);
  Serial.print(", BR=");
  Serial.print(servoAngles[CH_LIDBR]);
  Serial.print(", TR=");
  Serial.println(servoAngles[CH_LIDTR]);

  delay(50);
}
