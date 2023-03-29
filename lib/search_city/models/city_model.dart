class CityModel {
  final String name, timezone, country;
  final double latitude, longitude;

  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      CityModel(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone: json['timezone'],
      country: json['country'],
    );
}