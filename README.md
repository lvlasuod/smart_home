# Smart Home

Our world is increasingly interconnected - most of us own a smartphone and can access all kinds of information right from our pockets. From updating family and friends on social media, to scheduling our calendars and turning on the heating, we carry out a range of everyday tasks. With today's technology, smart homes can simplify and energize our lives, and in some cases, they can even save us money, such as controlling heating and lighting. It's relatively easy to incorporate as much or as little technology as you feel comfortable within a smart home.

## Prototype Testing

We’ve created a Publisher and Subscriber architecture that sends sensor data to a server. Using MQTT protocol we made ESP8266 and a client that will take data from the sensor and send it to an internal server which is Raspberry Pi in this case, Then from raspberry pi we send data to Google Firebase[Firebase is a platform developed by Google for creating mobile and web applications. Cloud server] and store them into a Realtime Database which is provided by Firebase.
After that we have developed the modern cross-platform Mobile application that can receive data from the firebase server also from the app users can send commands to the raspberry pi such as “turn the AC ON or OFF”, “TURN LIGHTS OFF or ON”, “LOCK DOORS”, “ACTIVE SECURITY ALARM”. The problem, however, was lack of actuators capable of adhering to these commands and updating our system.

## UI
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/1.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/2.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/3.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/4.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/5.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/6.jpeg?raw=true)
![UI images goes here](https://github.com/lvlasuod/smart_home/blob/master/7.jpeg?raw=true)


##  Addressing LSEP Issues

Smart home technology integration is on the rise, and it's typically intended to assist older people maintain their independence. However, it has the ability to limit their freedom and make them feel as though their privacy has been violated. The difficulty in finding a single definition that would apply to all circumstances, particularly in the case of smart home technologies, is based on legal interpretations of privacy. This is due to the fact that the perception of privacy invasion is more significant than the actuality of the situation. Residents may not comprehend what information is gathered, how it is used, or who has access to it, so senior housing providers should keep this in mind. Furthermore, some forms of technology are thought to be more intrusive than others. 


This project is dedicating to a IoT coursework for London Metropolitan University.

