import 'package:flutter/cupertino.dart';

class HourlyWeatherModel {
  final List<DateTime> time;
  final List<double> temperature_2m;
  final List<int> weathercode;

  HourlyWeatherModel({
    required this.time,
    required this.temperature_2m,
    required this.weathercode,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json){
    List<String> times = List<String>.from(json['hourly']['time']);
    List<DateTime> datesTime = [];
    for(String time in times){
      datesTime.add(DateTime.parse(time));
    }
    return HourlyWeatherModel(
        time: datesTime,
        temperature_2m: List<double>.from(json['hourly']['temperature_2m']),
        weathercode: List<int>.from(json['hourly']['weathercode']),
    );
  }
}