import 'dart:ffi';

class CurrentWeatherModel{
  final double temperature;
  final double windspeed;
  final int weathercode;
  final double precipitation_sum;
  final int precipitation_probability_max;

  CurrentWeatherModel({
    required this.precipitation_sum,
    required this.precipitation_probability_max,
    required this.temperature,
    required this.windspeed,
    required this.weathercode
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    return CurrentWeatherModel(
      precipitation_sum: json['daily']['precipitation_sum'][0],
      precipitation_probability_max: json['daily']['precipitation_probability_max'][0],
      temperature:json['current_weather']['temperature'],
      windspeed: json['current_weather']['windspeed'],
      weathercode: json['current_weather']['weathercode'],
    );
  }
}