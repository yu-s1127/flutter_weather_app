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
}
