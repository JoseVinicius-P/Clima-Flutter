import 'dart:convert';

import 'package:clima/home/models/current_weather_model.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherApi {

  Future<CurrentWeatherModel> fetchCurrentWeather() async{
    final response = await http
        .get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=-14.10&longitude=-46.63&daily=precipitation_sum,precipitation_probability_max&current_weather=true&timezone=America%2FSao_Paulo'));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      return CurrentWeatherModel.fromJson(decodedJson);
    }else{
      throw Exception('Failed to load current weather');
    }
  }
}