// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/Services/services.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  late WeatherData weatherInfo;
  bool isLoading = false;
  myWeather() {
    isLoading = false;
    WeatherServices().fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    weatherInfo = WeatherData(
      name: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0,
      minTemperature: 0,
      pressure: 0,
      seaLevel: 0,
      weather: [],
    );
    myWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE D,MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      backgroundColor: Color(0xFF676BD0),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: isLoading
                  ? WeatherDetail(
                      weather: weatherInfo,
                      formattedDate: formattedDate,
                      formattedTime: formattedTime,
                    )
                  : CircularProgressIndicator(
                      color: Colors.white,
                      
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final WeatherData weather;
  final String formattedDate;
  final String formattedTime;
  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Current Addr Name
        Text(
          weather.name,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        // For Showing Current Temperature
        Text(
          "${weather.temperature.current.toStringAsFixed(2)}°C",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        // For Weather Condition
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(
          height: 30,
        ),

        // For Current Date and Time
        Text(
          formattedDate,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cloudy.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        // Extra Weather Details
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 17,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Max",
                            value:
                                "${weather.maxTemperature.toStringAsFixed(2)}°C"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Min",
                            value:
                                "${weather.minTemperature.toStringAsFixed(2)}°C"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Wind", value: "${weather.wind.speed}km/hr"),
                      ],
                    ),
                  ],
                ),

                // Divider

                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Humidity", value: "${weather.humidity}%"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Pressure", value: "${weather.pressure}hPa"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.leaderboard,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                            title: "Sea-Level", value: "${weather.seaLevel}m"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Column weatherInfoCard({
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
