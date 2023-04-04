import 'dart:convert';
import 'dart:io';

import 'package:clima/home/models/current_weather_model.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherApi {

  Future<CurrentWeatherModel> fetchCurrentWeather({required double latitude, required double longitude, required String timezone}) async{
    final response = await http
        .get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=precipitation_sum,precipitation_probability_max&current_weather=true&timezone=$timezone'))
        .timeout(const Duration(seconds: 10),
        onTimeout: (){
          return http.Response('Time out', 408);
        });

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      return CurrentWeatherModel.fromJson(decodedJson);
    }else{
      return fetchCurrentWeather(latitude: latitude, longitude: longitude, timezone: timezone);
    }
  }
}