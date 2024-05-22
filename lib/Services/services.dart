import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=[Enter your latitude]&lon=[Enter Your Longitude]&appid=<your Api ID >"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception("Failed to Fetch Data");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
