<h1 align="center">Flutter Weather App</h1>

# Preview
<p align="center">
<img src="/assets/results/permission.png" height="480px"/> <img src="/assets/results/top.png" height="480px" /> <img src="/assets/results/bottom.png" height="480px" />
</p>

# Flutter Weather

A simple weather App created using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) and using weather API.

## Features
- Moisture indicator
- Automatically acquire user current location
- Permission for geolocation 
- Hourly weather information
- 7 days weather information 

## How to Run
1. Get your API key from any service.
2. Clone the repo
   ```sh
   git@github.com:MorgueMorg/Flutter-Weather-App.git
   ```
   or
   ```sh
   https://github.com/MorgueMorg/Flutter-Weather-App.git
   ```
   
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/api/api_key.dart** and paste your API key to the apiKey variable
   ```dart
   var apiKey = 'Paste Your API Key Here';
   ```
6. Run the App
