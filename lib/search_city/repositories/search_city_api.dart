import 'dart:convert';

import 'package:clima/home/models/current_weather_model.dart';
import 'package:clima/search_city/models/city_model.dart';
import 'package:http/http.dart' as http;

class SearchCityApi {

  Future<List<CityModel>> fetchSeachCities(String search) async{
    final response = await http
        .get(Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$search&language=pt'));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      List<dynamic> results = decodedJson['results'];
      List<CityModel> cities = results.map((city) => CityModel.fromJson(city)).toList();
      return cities;
    }else{
      throw Exception('Failed to load cities');
    }
  }
}