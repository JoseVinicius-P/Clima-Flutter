import 'dart:convert';

import 'package:clima/home/models/current_weather_model.dart';
import 'package:clima/search_city/models/city_model.dart';
import 'package:http/http.dart' as http;

class SearchCityApi {

  Future<List<CityModel>> fetchCities({required String search}) async{
    final response = await http
        .get(Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=iac&language=pt'));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      var results = decodedJson['results'] as List;
      List<CityModel> cities = results.map((json) => CityModel.fromJson(json)).toList();
      return cities;
    }else{
      throw Exception('Failed to load cities');
    }
  }
}