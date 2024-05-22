
# 🌤️ Weather App

Welcome to the **Weather App**! This application provides real-time weather updates including current date, time, location, humidity, minimum and maximum temperature, wind speed, pressure, and sea level using the [OpenWeatherMap API](https://openweathermap.org/api).

⚠️Please wait for gif to be loaded!

![Weather app 1](https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners/assets/85176765/b8c470af-df40-4abb-9d12-f67c3616431f)


## 🚀 Features

- 📅 **Current Date & Time**
- 📍 **Location**
- 💧 **Humidity**
- 🌡️ **Minimum & Maximum Temperature**
- 🌬️ **Wind Speed**
- 🏋️ **Pressure**
- 🌊 **Sea Level**
- ⏳ **Loading Screen**

## 📸 Screenshots

# Home Screen     

<img src="https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners/assets/85176765/164b2118-ebcd-4e48-82e5-6aa0fdc85bd9"  width="350" height="600" />


# Weather Details

<img src="https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners/assets/85176765/e6d86b67-7009-4ac4-9733-08b6a69ccc90"  width="500" height="300" />

# Loading Screen 

<img src="https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners/assets/85176765/fc69572c-106e-4760-a97c-5946368c144e"  width="350" height="600" />


## 🛠️ Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners.git
    ```
2. **Navigate to the project directory:**
    ```bash
    cd Flutter-Weather-App-For-Beginners
    ```
3. **Install dependencies:**
    ```bash
    flutter pub get
    ```
4. **Get your OpenWeatherMap API key:**
    - Sign up at [OpenWeatherMap](https://home.openweathermap.org/users/sign_up)
    - Get your API key from [here](https://home.openweathermap.org/api_keys)

5. **Go to `lib/Services/services.dart` file and add your API key in Place Of:**
    ```dart
    // services.dart
    <your Api ID>;
    ```

6. **Run the application:**
    ```bash
    flutter run 
    ```

## 📖 Usage

1. Open the app on your device or emulator.
2. Allow location access to fetch weather data for your current location(Not Neccesary / Just Change latitude and Longitude in "Service.dart" file).
3. View real-time weather information displayed beautifully.

## 🔧 Technologies Used

- **Flutter** - Framework for building the app
- **Dart** - Programming language used with Flutter
- **OpenWeatherMap API** - For fetching weather data

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.




## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-username/weather-app/issues).

##🤝 Things You can Contribute:

# 1.Location Service (How You can do it)
## 📲 Setting Up Location Permissions

### Android

1. **Open `android/app/src/main/AndroidManifest.xml` and add the following permissions:**
    ```xml
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    ```

2. **Specify the location permission in the `android/app/src/main/AndroidManifest.xml` within the `<application>` tag:**
    ```xml
    <application>
        <!-- Other configurations -->
        <meta-data android:name="flutterEmbedding" android:value="2" />
    </application>
    ```

### iOS

1. **Open `ios/Runner/Info.plist` and add the following entries for location permissions:**
    ```xml
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>We need your location to provide weather updates for your area.</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>We need your location to provide weather updates for your area.</string>
    ```

#

## 🌐 Links

- **Project Repository:** [GitHub](https://github.com/siddhu1919/Flutter-Weather-App-For-Beginners)
- **OpenWeatherMap:** [API Documentation](https://openweathermap.org/api)
- **Linkedin:** [Siddharth G Singh](https://www.linkedin.com/in/siddharth-g-singh-46b610201/)

---

