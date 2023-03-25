import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:clima/home/ui/widgets/time_condition_widget.dart';
import 'package:flutter/material.dart';

class ListHourlyWeatherWidget extends StatefulWidget {
  final bool hourlyWeatherIsToday;
  final HourlyWeatherModel hourlyWeatherModel;

  const ListHourlyWeatherWidget({
    super.key,
    required this.hourlyWeatherIsToday,
    required this.hourlyWeatherModel,
  });

  @override
  State<ListHourlyWeatherWidget> createState() => _ListHourlyWeatherWidgetState();

}

class _ListHourlyWeatherWidgetState extends State<ListHourlyWeatherWidget> {
  final controller = ScrollController();


  @override
  void initState() {
    super.initState();
    if(widget.hourlyWeatherIsToday){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.jumpTo((70*DateTime.now().hour).toDouble());
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        //Este ListView exibirá os dados de tempo por hora
        child: ListView.builder(
            controller: controller,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: widget.hourlyWeatherModel.time.length~/2,
            itemBuilder: (context, index){
              return Row(
                children: [
                  if(index == 0)
                    SizedBox(width: 30),
                  TimeConditionWidget(
                    time: widget.hourlyWeatherModel.time[widget.hourlyWeatherIsToday ? index : index+24],
                    weathercode: widget.hourlyWeatherModel.weathercode[widget.hourlyWeatherIsToday ? index : index+24],
                    temperature: widget.hourlyWeatherModel.temperature_2m[widget.hourlyWeatherIsToday ? index : index+24],
                  ),
                  if(index == (widget.hourlyWeatherModel.time.length~/2) -1)
                    SizedBox(width: 30),
                ],
              );
            }
        )
    );
  }
}