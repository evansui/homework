#include <Servo.h> 
  
Servo myservo; 

int sensorLeft = A0;
int sensorRight = A1;
  

void setup() 
{
  Serial.begin(9600); 
  pinMode (3, OUTPUT);
  pinMode (5, OUTPUT);
  
}

void loop() 
{
    int readingLeft, readingRight;
  
  readingLeft = analogRead(sensorLeft);
  readingRight = analogRead(sensorRight);
   
  if (readingLeft > 600) {
    digitalWrite(3, 220);                   
    delay(50);                          
  } 
  if (readingRight > 800) {
    digitalWrite(5, 220);              
    delay(50);   
                          
  } else {
    digitalWrite(5, 0);  
    digitalWrite(3, 0); 
  }
  Serial.print("left: "); Serial.print(readingLeft);
  Serial.print(" right: "); Serial.println(readingRight);  
}
