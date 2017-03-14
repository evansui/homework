const int  buttonPin = 2;
int buttonPushCounter = 0;
int buttonState = 0;
int lastButtonState = 0;

#include <Servo.h>
Servo myservo;


void setup() {
  myservo.attach(9);
  pinMode(buttonPin, INPUT);
  Serial.begin(9600);

}

void loop() {
  
  buttonState = digitalRead(buttonPin);
  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:  ");
      
      }
     int positions[] = {10, 50, 90, 120, 150,180};
      int index ;
      index = buttonPushCounter % 6;
      Serial.print ("Moving to index = ");
      Serial.println (index);
      for (index = 0; index < 6; index++); {
        myservo.write(positions[buttonPushCounter % 6]);
        delay (100);
    }
    

  }
  lastButtonState = buttonState;


}
