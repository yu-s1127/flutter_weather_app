import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather = Weather(
    temperature: 15,
    description: '晴れ',
    temperatureMaximum: 18,
    temperatureMinimum: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            const Text(
              '大阪市',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(currentWeather.description ?? ""),
            Text(currentWeather.temperature != null
                ? '${currentWeather.temperature}°'
                : ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(currentWeather.temperatureMaximum != null
                      ? '最高：${currentWeather.temperatureMaximum}°'
                      : ""),
                ),
                Text(currentWeather.temperatureMinimum != null
                    ? '最低：${currentWeather.temperatureMinimum}°'
                    : ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
