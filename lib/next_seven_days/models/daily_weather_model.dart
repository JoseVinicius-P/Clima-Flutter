class DailyWeatherModel {
  final List<DateTime> time;
  final List<double> temperature_2m_max;
  final List<double> temperature_2m_min;
  final List<int> weathercode;

  DailyWeatherModel({
    required this.time,
    required this.temperature_2m_max,
    required this.temperature_2m_min,
    required this.weathercode,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json){
    List<String> times = List<String>.from(json['daily']['time']);
    List<DateTime> datesTime = [];
    for(String time in times){
      datesTime.add(DateTime.parse(time));
    }
    print(json['daily']['temperature_2m_max'][0]);
    return DailyWeatherModel(
      time: datesTime,
      temperature_2m_max: List<double>.from(json['daily']['temperature_2m_max']),
      temperature_2m_min: List<double>.from(json['daily']['temperature_2m_min']),
      weathercode: List<int>.from(json['daily']['weathercode']),
    );
  }
}