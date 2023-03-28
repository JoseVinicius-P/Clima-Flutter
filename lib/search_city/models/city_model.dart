class CityModel {
  final String name, timezone, country, admin1;
  final double latitude, longitude;

  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.country,
    required this.admin1,
  });

  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone:json['timezone'],
      country: json['country'],
      admin1: json['admin1'],
    );
  }
}