
Project Name: Soothe Lights

Describe goals of project briefly:
Use Arduino to produce interaction with people and the environment of the lights, 
It may change different colors by the change in environment, Changes in these colors can improve the user's mood.
For example, when the temperature is high there is blue light, when the temperature is low there is red light,

Parts lis:
1. LED lights with (12v or 9v) - Transformers?
2. Light sensor
3. Temperature Sensor
4. Real time module

Project works:
Case 1:
	When the light sensor feels the ambient light has become stronger, it means that 
	the brightness of the lamp decreases during the day.
	When the light sensor feels the light of the environment becomes weak, it means 
	that the brightness of the lamp is increased.2. Light sensor


Case 2: 
	When the temperature sensor feels high temperature, the light turns blue.
	If the temperature exceeds 50 ° c, it means there may be a flood hazard, and the 
	lamp turns red to indicate a warning.
	When the temperature is below 20 ° c, the orange light is emitted.
Case 3:
	When the humidity is greater than 60%, and the temperature below 20 °c, 
	it means it is a rainy day (
	The lights will turn green and blink like breathing.
Case 4:
	When the time after 23 o'clock, that the owner may be ready to sleep,
	the color of the lamp becomes dark
	After 24 o'clock, the light turns into a faint night light

Process: 
At the very beginning, I tried to use some RGB LEDs to achieve my goal. However, 
based on my research, I didn’t find some perfect lights because I need a lot of them to have enough brightness. 
Then I thought LED strip might be a good choice because it’s bright enough and has different colors. 

The most complicated part is how to write my code.
My light has one temperature sensor, one light sensor,one real-time module and one switch. At first,
I found a temperature sensor code and a light sensor code online and rewrote them.
They worked well separately at that time. However, when I combined them together, 
the number from the temperature sensor was not stable and it was influenced by the light sensor.
I thought this might be a problem of the code and check it many times.
Finally, I found there was something wrong with the breadboard. 
Although it was easy to solve this problem, it took me a long time to figure out what the problem is. 

After that, I added a real-time module code. For that time, 
I rewrote my code many times because I wanted to figure out the whole working process of this light. 
It has several different input parts and they need to work in a proper order. 
After that, originally I wanted to add a sound sensor to make my light more interesting, 
but someone in our class used the same idea.
Then I changed it to a switch because I thought sometimes users just need a normal light.
This switch can convert the light between two different modes of operation. 

The next step is about testing. When I used an extra power, 
the number from the temperature sensor was not stable and I didn’t know why. 
I asked help from Michael and he told me this might be a problem about the same ground pin. 
This light has four different modules and they will influence each other when they connect the same ground pin. 
I separated them into two ground pins and solved this problem.

Finally, I wanted to use a shield to make my circuit cleaner, 
but I found there was no need to do this because of the most part of my circuit wires.
Then I made a wood box for it to made it looks beautiful. 
This was a memorable experience and I achieved my original goal of this soothe light.


