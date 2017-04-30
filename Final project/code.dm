
/********************************
 * TMP36 DS1307 
 */
#include <Wire.h>
#include <DS1307.h>

//define LED_colore in 
#define LED_GREEN     3
#define LED_BLUE      5
#define LED_RED       6 
#define LED_WHITE     9 
//define switch to control 2state
#define SWITCH_PIN    2
//define sensors
#define TEMP_PIN    A0
#define LIGHT_PIN   A1

float temperature = 0;       //temperature    
float voltage, degreesC;
//Data variable definition
unsigned int light;
int rtc[7];
bool fade=0;
float light_temp;
unsigned char blueTemp,greenTemp,redTemp;
bool state=0;

void setup() 
{
    Serial.begin(9600); 
     //led init
    pinMode(LED_GREEN, OUTPUT);
    pinMode(LED_BLUE, OUTPUT);
    pinMode(LED_RED, OUTPUT);
    pinMode(LED_WHITE, OUTPUT);
     //set led pin to high
    pinMode(SWITCH_PIN, INPUT_PULLUP);//switch initialization
    //RTC Clock initialization
    RTC.stop();
    RTC.set(DS1307_SEC,1);
    RTC.set(DS1307_MIN,50);
    RTC.set(DS1307_HR,14);
    RTC.set(DS1307_DOW,5);
    RTC.set(DS1307_DATE,14);
    RTC.set(DS1307_MTH,4);
    RTC.set(DS1307_YR,17);
    RTC.start();

    Serial.println("Detect Begin:");
} 

void loop() 
{ 
    //get LED Value
   Serial.print("Green = ");
   Serial.println(greenTemp);
   Serial.print("Red = ");
   Serial.println(redTemp);
   Serial.print("Blue = ");
   Serial.println(blueTemp);
 
    //get clock
    RTC.get(rtc,true);
    for(int i=0;i<7;i++)
    {
      Serial.print(rtc[i]);  
      Serial.print(" ");  
    }
    Serial.println(" ");  
    //get temperature
    voltage = getVoltage(TEMP_PIN); //sensor voltage read
    degreesC = (voltage - 0.5) * 100.0;   //temperature count
    Serial.print(degreesC);                                        //print temperature
    Serial.println("C");                                             
    //switch analog
    if(digitalRead(SWITCH_PIN)==0)
    {
        if(state==0)//close color
        {
            analogWrite(LED_GREEN, 0);
            analogWrite(LED_RED, 0);
            analogWrite(LED_BLUE, 0);
          state=1;//just white light
        }
        else
          state=0;//
    }
    if(state==0)//open color light
    {
        //temperature control color
        if(degreesC<20)
        {
            analogWrite(LED_GREEN, 0);
            analogWrite(LED_RED, 0);
            analogWrite(LED_BLUE, 255);
        }
        if(degreesC>20 && degreesC<30)
        {
            blueTemp=map(degreesC,20,30,255,0);
            greenTemp=map(degreesC,20,30,0,255);
            analogWrite(LED_GREEN, greenTemp);
            analogWrite(LED_BLUE, blueTemp);
        }
        if(degreesC>25 && degreesC<35)
        {
            redTemp=map(degreesC,25,35,0,255);
            analogWrite(LED_GREEN, greenTemp);
        }
    }

    //get light sensor
    light=analogRead(LIGHT_PIN);
    Serial.print("light:");    
    Serial.println(light);                           
    
    //time and light control white LED  0~1023
    if(rtc[2]>=23 || rtc[2]<7)
    {
      //close light
      analogWrite(LED_WHITE, 0);
      fade=0;
    }
    else if(rtc[2]>=7 && rtc[2]<22)
    {
      //The relationship between light intensity and light
      analogWrite(LED_WHITE, light/4);
    }
    else if(rtc[2]>=22 && rtc[2]<23)
    {
      //The light becomes dim
      if(fade==0)//Light gradient mode
      {
        fade=1;
        light_temp=light;
      }
      if(fade == 1)//Light gradient mode
      {
        analogWrite(LED_WHITE, light_temp/4);
        if(light_temp>0)
          light_temp=light_temp-0.2;          //Brightness automatic weakening
      }
    }
    delay(1000); 
}

//get voltage function
float getVoltage(int pin)
{
    return (analogRead(pin) * 0.004882814);
}
