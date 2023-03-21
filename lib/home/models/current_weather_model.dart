import 'dart:ffi';

class CurrentWeatherModel{
  final double temperature;
  final double windspeed;
  final int weathercode;

  CurrentWeatherModel({
    required this.temperature,
    required this.windspeed,
    required this.weathercode
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    return CurrentWeatherModel(
        temperature: json['temperature'],
        windspeed: json['windspeed'],
        weathercode: json['weathercode'],
    );
  }
}