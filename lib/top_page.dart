import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather.dart';
import 'package:intl/intl.dart';

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

  List<Weather> houryWeather = [
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 10),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 11),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 12),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 13),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 14),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 15),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 16),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 17),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 18),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 19),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 20),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 21),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 22),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 23),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 24),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 1),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 2),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 3),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 4),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 5),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 20,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 6),
      rainyPercentage: 0,
    ),
    Weather(
      temperature: 18,
      description: '雨',
      time: DateTime(2021, 10, 1, 7),
      rainyPercentage: 90,
    ),
    Weather(
      temperature: 17,
      description: '曇り',
      time: DateTime(2021, 10, 1, 8),
      rainyPercentage: 15,
    ),
    Weather(
      temperature: 19,
      description: '晴れ',
      time: DateTime(2021, 10, 1, 9),
      rainyPercentage: 0,
    ),
  ];

  List<Weather> dailyWeather = [
    Weather(
        temperatureMaximum: 20,
        temperatureMinimum: 12,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 1)),
    Weather(
        temperatureMaximum: 22,
        temperatureMinimum: 14,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMaximum: 21,
        temperatureMinimum: 10,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 3)),
    Weather(
        temperatureMaximum: 20,
        temperatureMinimum: 12,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 4)),
    Weather(
        temperatureMaximum: 22,
        temperatureMinimum: 14,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 5)),
    Weather(
        temperatureMaximum: 21,
        temperatureMinimum: 10,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 6)),
    Weather(
        temperatureMaximum: 20,
        temperatureMinimum: 12,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 7)),
    Weather(
        temperatureMaximum: 22,
        temperatureMinimum: 14,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 8)),
    Weather(
        temperatureMaximum: 21,
        temperatureMinimum: 10,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 9)),
    Weather(
        temperatureMaximum: 20,
        temperatureMinimum: 12,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 10)),
    Weather(
        temperatureMaximum: 22,
        temperatureMinimum: 14,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 11)),
    Weather(
        temperatureMaximum: 21,
        temperatureMinimum: 10,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 12)),
    Weather(
        temperatureMaximum: 20,
        temperatureMinimum: 12,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 13)),
    Weather(
        temperatureMaximum: 22,
        temperatureMinimum: 14,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 14)),
    Weather(
        temperatureMaximum: 21,
        temperatureMinimum: 10,
        rainyPercentage: 0,
        time: DateTime(2021, 10, 15)),
  ];

  List<String> weekDay = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                onSubmitted: (value) => print(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '郵便番号を入力',
                ),
              ),
            ),
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
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            const Divider(
              height: 0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: houryWeather.map((weather) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Text(
                          '${DateFormat('H').format(weather.time!)}時',
                        ),
                        Text(
                          '${weather.rainyPercentage}%',
                          style: const TextStyle(color: Colors.lightBlue),
                        ),
                        const Icon(Icons.wb_sunny_sharp),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${weather.temperature}°',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: dailyWeather.map((weather) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                  '${weekDay[weather.time!.weekday - 1]}曜日'),
                              width: 50,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.wb_sunny_sharp),
                                Text(
                                  '${weather.rainyPercentage}%',
                                  style:
                                      const TextStyle(color: Colors.lightBlue),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${weather.temperatureMaximum}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      )),
                                  Text('${weather.temperatureMinimum}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.4),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
