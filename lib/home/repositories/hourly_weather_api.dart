import 'dart:convert';

import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:http/http.dart' as http;

class HourlyWeatherApi {

  Future<HourlyWeatherModel> fetchHourlyWeather() async {
    final response = await http
        .get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=-14.10&longitude=-46.63&hourly=temperature_2m,weathercode&timezone=America%2FSao_Paulo'));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      return HourlyWeatherModel.fromJson(decodedJson);
    }else{
      throw Exception('Failed to load hourly weather');
    }
  }
}