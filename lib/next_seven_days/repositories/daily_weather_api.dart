import 'dart:convert';

import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:clima/next_seven_days/models/daily_weather_model.dart';
import 'package:http/http.dart' as http;

class DailyWeatherApi {

  Future<DailyWeatherModel> fetchDailyWeather({required double latitude, required double longitude, required String timezone}) async {
    final response = await http
        .get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weathercode,temperature_2m_max,temperature_2m_min&forecast_days=8&timezone=$timezone'));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      return DailyWeatherModel.fromJson(decodedJson);
    }else{
      throw Exception('Failed to load daily weather');
    }
  }
}