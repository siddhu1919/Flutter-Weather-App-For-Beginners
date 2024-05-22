import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=22.8252&lon=70.8491&appid=b40274ecbe77598db6ece2c999b23c35"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception("Failed to Fetch Data");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
