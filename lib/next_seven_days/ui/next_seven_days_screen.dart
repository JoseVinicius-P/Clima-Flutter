
import 'package:clima/next_seven_days/blocs/interpreter_date.dart';
import 'package:clima/next_seven_days/models/daily_weather_model.dart';
import 'package:clima/next_seven_days/repositories/daily_weather_api.dart';
import 'package:clima/next_seven_days/ui/widgets/day_of_week_widget.dart';
import 'package:clima/shared/blocs/interpreter_hour.dart';
import 'package:clima/shared/blocs/interpreter_weather_code.dart';
import 'package:clima/shared/ui/widgets/background_widget.dart';
import 'package:clima/shared/ui/widgets/container_shimmer_widget.dart';
import 'package:clima/values/MyColors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

//Classe que é a tela NextSevenDaysScreen, ou Teka dos próximos 7 dias
class NextSevenDaysScreen extends StatefulWidget{
  final double latitude, longitude;
  final String timezone;

  const NextSevenDaysScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.timezone
  });

  @override
  State<NextSevenDaysScreen> createState() => _NextSevenDays();

}

class _NextSevenDays extends State<NextSevenDaysScreen>{
  late Future<DailyWeatherModel> futureDailyWeatherModel;
  dynamic conectivityListenner;

  @override
  void initState() {
    super.initState();
    fetchDailyWeather();
    initListennerConectivity();
  }

  @override
  void dispose() {
    conectivityListenner.cancel();
    super.dispose();
  }

  void initListennerConectivity(){
    conectivityListenner = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        setState(() {
          fetchDailyWeather();
        });
      }
    });
  }

  void fetchDailyWeather(){
    futureDailyWeatherModel = DailyWeatherApi().fetchDailyWeather(latitude: widget.latitude, longitude: widget.longitude, timezone: widget.timezone);
  }

  @override
  Widget build(BuildContext context) {

    //Inicializando tema geral do app
    var theme = Theme.of(context);

    return Scaffold(
      //Faz com que body se posicione sob a appbar
      extendBodyBehindAppBar: true,
      //definindo app bar
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: MyColors.textColorPrimary,
        ),
        centerTitle: true,
        title: Text(
          'Próximos 7 dias',
          style: theme.textTheme.titleSmall,
        ),
        //Definindo transparencia total para app bar
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          BackgroundWidget(isNight: InterpreterHour.isNight(DateTime.now().hour)),
          Padding(
            //Definindo espaçamento entre bordas da tela e elementos
            padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
            child: Column(
              children: [
                //Impedindo que elementos fiquem em local errado (statusbar)
                SafeArea(
                  child:
                  FutureBuilder<DailyWeatherModel>(
                    future: futureDailyWeatherModel,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: 7,
                            itemBuilder: (context, index){
                              int i = index + 1;
                              return Column(
                                children: [
                                  DayOfWeekWidget(
                                      dayWeek: InterpreterDate.getNameOfWeekDay(snapshot.data!.time[i].weekday),
                                      temperature: '${snapshot.data!.temperature_2m_min[i].round()}º/${snapshot.data!.temperature_2m_max[i].round()}º',
                                      img_name: InterpreterWeatherCode.getImgNameWeather(
                                          snapshot.data!.weathercode[i],
                                          InterpreterHour.isNight(DateTime.now().hour)
                                      )
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            }
                        );
                      }else{
                        return Column(
                          children: [
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                            ContainerShimmerWidget(height: 80),
                            SizedBox(height: 10),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}