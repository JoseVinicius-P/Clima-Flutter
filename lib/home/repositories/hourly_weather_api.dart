import 'dart:convert';

import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:http/http.dart' as http;

class HourlyWeatherApi {

  Future<HourlyWeatherModel> fetchHourlyWeather({required double latitude, required double longitude, required String timezone}) async {
    final response = await http
        .get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,weathercode&forecast_days=2&timezone=$timezone'))
        .timeout(const Duration(seconds: 10),
        onTimeout: (){
          return http.Response('Time out', 408);
        });

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      return HourlyWeatherModel.fromJson(decodedJson);
    }else{
      return fetchHourlyWeather(latitude: latitude, longitude: longitude, timezone: timezone);
    }
  }
}