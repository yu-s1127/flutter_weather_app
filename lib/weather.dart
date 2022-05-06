import 'dart:convert';

import 'package:flutter_weather_app/environment_variables.dart';
import 'package:http/http.dart';

class Weather {
  double? temperature;
  double? temperatureMaximum;
  double? temperatureMinimum;
  String? description;
  double? longitude;
  double? latitude;
  String? icon;
  DateTime? time;
  int? rainyPercentage;

  Weather(
      {this.temperature,
      this.temperatureMaximum,
      this.temperatureMinimum,
      this.description,
      this.longitude,
      this.latitude,
      this.icon,
      this.time,
      this.rainyPercentage});

  static Future<Weather?> getCurrentWeather(String zipCode) async {
    String _zipCode;
    String apiKey = EnvironmentVariables.weatherApiKey;

    if (zipCode.contains('-')) {
      _zipCode = zipCode;
    } else {
      _zipCode = zipCode.substring(0, 3) + "-" + zipCode.substring(3);
    }

    String url =
        'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&appid=$apiKey&lang=ja&units=metric';

    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      Weather currentWeather = Weather(
        description: data['weather'][0]['description'],
        temperature: data['main']['temp'],
        temperatureMaximum: data['main']['temp_max'],
        temperatureMinimum: data['main']['temp_min'],
      );

      print(data.toString());
      return currentWeather;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
