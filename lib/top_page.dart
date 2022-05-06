import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather.dart';
import 'package:flutter_weather_app/zip_code.dart';
import 'package:intl/intl.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather? currentWeather;
  String address = 'ー';
  String? errorMessage;

  List<Weather>? hourlyWeather;

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
                onSubmitted: (value) async {
                  Map<String, String> response =
                      await ZipCode.searchAddressFromZipCode(value);
                  if (response.containsKey('address')) {
                    address = response['address'].toString();
                    currentWeather = await Weather.getCurrentWeather(value);
                    hourlyWeather = await Weather.getHourlyWeather(
                        lon: currentWeather!.longitude,
                        lat: currentWeather!.latitude);
                  }

                  setState(() {
                    errorMessage = response['message'];
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '郵便番号を入力',
                ),
              ),
            ),
            Text(
              errorMessage == null ? '' : errorMessage.toString(),
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            Text(
              address,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            Text(currentWeather == null
                ? ""
                : (currentWeather!.description ?? "")),
            Text(
                currentWeather == null
                    ? "ー"
                    : (currentWeather!.temperature != null
                        ? '${currentWeather!.temperature}°'
                        : ""),
                style: const TextStyle(
                  fontSize: 80,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(currentWeather == null
                      ? "ー"
                      : (currentWeather!.temperatureMaximum != null
                          ? '最高：${currentWeather!.temperatureMaximum}°'
                          : "")),
                ),
                Text(currentWeather == null
                    ? "ー"
                    : (currentWeather!.temperatureMinimum != null
                        ? '最低：${currentWeather!.temperatureMinimum}°'
                        : "")),
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
              child: hourlyWeather == null
                  ? Container()
                  : Row(
                      children: hourlyWeather!.map((weather) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat('H').format(weather.time!)}時',
                              ),
                              Image.network(
                                  'https://openweathermap.org/img/wn/${weather.icon}.png'),
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
                                  Text('${weather.temperatureMaximum}°',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      )),
                                  Text('${weather.temperatureMinimum}°',
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
