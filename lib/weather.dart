import 'dart:convert';

import 'package:flutter_weather_app/environment_variables.dart';
import 'package:http/http.dart';

class Weather {
  int? temperature;
  int? temperatureMaximum;
  int? temperatureMinimum;
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

  static String publicParameter = EnvironmentVariables.weatherApiKey;

  static Future<Weather?> getCurrentWeather(String zipCode) async {
    String _zipCode;

    if (zipCode.contains('-')) {
      _zipCode = zipCode;
    } else {
      _zipCode = zipCode.substring(0, 3) + "-" + zipCode.substring(3);
    }

    String url =
        'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&appid=$publicParameter&lang=ja&units=metric';

    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      Weather currentWeather = Weather(
        description: data['weather'][0]['description'],
        temperature: data['main']['temp'].toInt(),
        temperatureMaximum: data['main']['temp_max'].toInt(),
        temperatureMinimum: data['main']['temp_min'].toInt(),
        longitude: data['coord']['lon'],
        latitude: data['coord']['lat'],
      );

      print(data.toString());
      return currentWeather;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Weather>?> getHourlyWeather(
      {double? lon, double? lat}) async {
    if (lon == null || lat == null) {
      return null;
    }

    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$publicParameter&lang=ja&units=metric';

    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      List<dynamic> hourlyWeatherData = data['hourly'];
      List<Weather> hourlyWeather = hourlyWeatherData.map((weather) {
        return Weather(
          time: DateTime.fromMillisecondsSinceEpoch(weather['dt'] * 1000),
          temperature: weather['temp'].toInt(),
          icon: weather['weather'][0]['icon'],
        );
      }).toList();
      return hourlyWeather;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
