# CafePlugGuardian-WebClient

## CafePlugGuardian Project

### Introduction

CafePlugGuardian is a capstone design project at the Chung-Ang University's Department of Software Engineering.

Please note that we will not be accepting contributions for CafePlugGuardian, as it is a Capstone Design Project.

#### The Goal of CafePlugGuardian Project

1. The pin number allows only cafe customers to use the plug, preventing unauthorized use of the plug.
2. Limit the amount of electricity to restrict customers who use excessive power or stay for long periods of time.
3. By analyzing the current patterns of devices in use, devices not permitted in the cafe, such as smartphones and laptop chargers, are automatically blocked through machine learning.

### Structure of CafePlugGuardian

<img width="80%" src="https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Server/assets/55429793/74940115-831a-49f7-ab9a-3d5dc402089a"/>

### Sub Projects of CafePlugGuardian

- [CafePlugGuardian-Client](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Client)
  - Cafe Manager App - flutter app
- [CafePlugGuardian-WebClient](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-WebClient)
  - Cafe Customer Web - flutter web
- [CafePlugGuardian-Server](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Server)
  - Backend server - express.js
- [CafePlugGuardian-Hardware](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-Hardware)
  - SmartPlug embedded system - arduino(tasmota open source)
- [CafePlugGuardian-ML](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-ML)
  - AI model - pytorch, GRU model
- [CafePlugGuardian-ML_Server_Flask](https://github.com/CAU-Capstone-PPL/CafePlugGuardian-ML_Server_Flask)
  - AI server - flask

### Additional Requirements

- MongoDB
  - NoSQL DBMS
  - In our project, we install and use mongoDB on an ec2 instance.
  - Install and run mongoDB, or use a mongoDB server.
- MQTT Broker
  - In our project, we install and use mosquitto as an MQTT broker on an ec2 instance.
  - You can install another MQTT broker or use a separate broker server if you have one.

## CafePlugGuardian-WebClient

### Introduction

CafePlugGuardian-WebClient is a part of CafePlugGuardian project.

It is implemented on the web and can be accessed using the QR code attached to the smart plug(hardware).

Cafe customers can log in by choosing between non-members and members, and mileage service is available when logging in.

The Cafe customers enters the PIN number issued on the receipt and presses the "Charge" button to charge the plug.

You can monitor the power of your plug.

- You can see how much power you have allocated, how much power you have used, and so on.

If the plug is turned off during service use, you can check the plug-off log to see why it was turned off, and you can use it by turning it on again.

- If the power is exhausted, you can order more menus and get a receipt, press the 'Charge' button and enter your PIN number to recharge the power.

- When connecting non-acceptable equipment, remove the non-acceptable equipment from the plug and press the 'Reconnect' button to operate the plug normally.

If you use it as a member, you can use the mileage service and order menus through mileage at cafe mileage shop. You can also get mileage based on the amount of remaining power by pressing the 'End of Use' button.

### Development environment

- Language

  - Dart
  - Version: 3.1.0

- Framework

  - Flutter
  - Version: 3.13.2

- Development Tools
  - Visual Studio Code
  - Git

### How to use CafePlugGuardian-Client

1. Install Dart SDK

2. Install Flutter SDK

3. Install Android Studio or Visual Studio Code (optional)

4. Clone the Project

5. Install Dependencies

6. Connect Chrome

7. Run the Application

## License

This program is licensed under MIT
