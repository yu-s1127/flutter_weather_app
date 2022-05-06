import 'package:flutter/material.dart';
import 'package:flutter_weather_app/top_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}

// TODO: 検索時に郵便番号から住所を取得・表示
// TODO: 検索欄への入力内容に間違いがある際にエラーを表示
// TODO: 現在の天気情報を取得
// TODO: 現在の天気情報をdartで取得
// TODO: 取得した情報から現在の天気情報を表示
// TODO: 1時間ごとの天気を表示
// TODO: 取得した情報から1時間ごとの天気を表示
// TODO: 日毎の天気情報を取得
// TODO: 取得した情報から日毎の天気情報を表示