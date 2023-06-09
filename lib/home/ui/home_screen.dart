import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima/home/models/current_weather_model.dart';
import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:clima/home/repositories/current_weather_api.dart';
import 'package:clima/home/repositories/hourly_weather_api.dart';
import 'package:clima/home/ui/widgets/condition_weather_widget.dart';
import 'package:clima/home/ui/widgets/list_hourly_weather_widget.dart';
import 'package:clima/home/ui/widgets/current_weather_widget.dart';
import 'package:clima/shared/blocs/interpreter_hour.dart';
import 'package:clima/shared/ui/widgets/background_widget.dart';
import 'package:clima/shared/ui/widgets/container_shimmer_widget.dart';
import 'package:clima/home/blocs/current_date.dart';
import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

//Este tela é a principal do app, ele mostra os dados completos de tempo atual
class HomeScreen extends StatefulWidget{

  final String name, country, timezone;
  final double longitude, latitude;

  const HomeScreen({
    super.key,
    required this.name,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.timezone
  });

  @override
  State<HomeScreen> createState() => _Home();

}

class _Home extends State<HomeScreen>{

  late Future<CurrentWeatherModel>? futureCurrentWeather;
  late Future<HourlyWeatherModel>? futureHourlyWeather;
  var hourlyWeatherIsToday = true;
  dynamic conectivityListenner;

  @override
  void initState() {
    super.initState();
    fetchCurrentWeather();
    fetchHourlyWeather();
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
          fetchCurrentWeather();
          fetchHourlyWeather();
        });
      }
    });
  }

  void fetchCurrentWeather(){
    futureCurrentWeather = CurrentWeatherApi().fetchCurrentWeather(latitude: widget.latitude, longitude: widget.longitude, timezone: widget.timezone);
  }

  void fetchHourlyWeather(){
    futureHourlyWeather = HourlyWeatherApi().fetchHourlyWeather(latitude: widget.latitude, longitude: widget.longitude, timezone: widget.timezone);
  }
  
  void toSearchCityScreen(){
    Navigator.pushReplacementNamed(context, '/searchCityScreen',);
  }

  void toNextSevenDaysScreen(){
    Navigator.pushNamed(context,
        '/nextSevenDaysScreen',
        arguments: {
          'latitude': widget.latitude,
          'longitude': widget.longitude,
          'timezone': widget.timezone,
        });
  }

  @override
  Widget build(BuildContext context) {

    //Obtendo tema geral do app
    var theme =  Theme.of(context);
    //Define cor que será exibida quando usuário tocar no textbutton
    var overlayColor = MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyColors.textColorPrimary.withOpacity(0.2);
        }
        return Colors.transparent;
      },
    );

    void setIsToday(bool hourlyWeatherIsToday){
      setState(() {
        this.hourlyWeatherIsToday = hourlyWeatherIsToday;
      });
    }

    return Scaffold(
      //Fazendo body ficar sob app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: MyColors.textColorPrimary,
        ),
        //forçando app bar ficar transparente o tempo todo
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        //Definindo icon que redireciona para tela de buscar cidade
        actions: <Widget> [
          IconButton(
              onPressed: () => toSearchCityScreen(),
              icon: Icon(Icons.search),
          ),
        ],
      ),
      //Este Stack é definida para que possamos colocar o container
      //com o papel de parede sem depender do scrrol view, dessa forma
      //o papel de parede sempre cupará a tela toda
      body: Stack(
        //Para ocupar o máximo de espaço
        children: [
          BackgroundWidget(isNight: InterpreterHour.isNight(DateTime.now().hour)),
          //Esse SingleChildScrollView é usado para que em caso de telas
          //pesquenas ou em rotação orizontal o usuário consiga rola para ver o conteudo
          SingleChildScrollView(
            child: Column(
              children: [
                //Para conteúdo não ocupar a status bar e app bar
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 30.0, left: 30.0),
                    child:  Column(
                      children: [
                        //Este elemento é a cidade que o usuário selecionou
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                '${widget.name}, ${widget.country}',
                                style: theme.textTheme.titleLarge,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                maxFontSize: 36,
                                minFontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        //Estes são os dados de data
                        Row(
                          children: [
                            Text(
                              CurrentDate().getCurrentDateFormatted(),
                              style: theme.textTheme.labelSmall,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        //Este elemento contain os dados principais como imagem
                        //que representa o clima, temperatura e descrição do clima
                        FutureBuilder<CurrentWeatherModel>(
                          future: futureCurrentWeather,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return CurrentWeatherWidget(currentWeather: snapshot.data!);
                            }else{
                              return ContainerShimmerWidget(height: 140);
                            }
                          },
                        ),
                        const SizedBox(height: 70),
                        //Cada item deste define um tipo de condição do tempo
                        FutureBuilder<CurrentWeatherModel>(
                            future: futureCurrentWeather,
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                return ConditionWeatherWidget(string_dado: MyStrings.chuva, dado: '${snapshot.data!.precipitation_probability_max}%');
                              }else{
                                return ContainerShimmerWidget(height: 70);
                              }
                            }
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<CurrentWeatherModel>(
                          future: futureCurrentWeather,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return ConditionWeatherWidget(string_dado: MyStrings.vento, dado: '${snapshot.data!.windspeed}km/h');
                            }else{
                              return ContainerShimmerWidget(height: 70);
                            }
                          }
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<CurrentWeatherModel>(
                            future: futureCurrentWeather,
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                return ConditionWeatherWidget(string_dado: MyStrings.precipitacao, dado: '${snapshot.data!.precipitation_sum}mm');
                              }else{
                                return ContainerShimmerWidget(height: 70);
                              }
                            }
                        ),
                        SizedBox(height: 40),
                        FutureBuilder<HourlyWeatherModel>(
                          future: futureHourlyWeather,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              //Este row armazena os botões Hoje, Amanhã e Próximos sete dias
                              return Row(
                                children: [
                                  //Botão Hoje
                                  TextButton(
                                    onPressed: () => setIsToday(true),
                                    //Este código define a cor que será usada em caso de clique do usuário
                                    style: ButtonStyle(
                                      overlayColor: overlayColor,
                                    ),
                                    child: Text(
                                      MyStrings.hoje,
                                      style: theme.textTheme.labelMedium?.copyWith(
                                          fontSize: hourlyWeatherIsToday ? 15 : 13,
                                          fontWeight: hourlyWeatherIsToday ? FontWeight.bold : FontWeight.normal),
                                    ),
                                  ),
                                  //Espaço entre botões
                                  SizedBox(width: 5),
                                  //Botão amanhã
                                  TextButton(
                                    onPressed: () => setIsToday(false),
                                    //Este código define a cor que será usada em caso de clique do usuário
                                    style: ButtonStyle(
                                      overlayColor: overlayColor,
                                    ),
                                    child: Text(
                                      MyStrings.amanha,
                                      style: theme.textTheme.labelMedium?.copyWith(
                                        fontSize: hourlyWeatherIsToday ? 13 : 15,
                                        fontWeight: hourlyWeatherIsToday ? FontWeight.normal : FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  //Spacer é usado para ocupar todos o espaço forcando o próximo elemento a alinhar-se a direita
                                  Spacer(),
                                  //Botão Proximos sete dias
                                  TextButton(
                                    //Redireciona para a tela NextSevenDaysScreen
                                    onPressed: () => toNextSevenDaysScreen(),
                                    //Este código define a cor que será usada em caso de clique do usuário
                                    style: ButtonStyle(
                                      overlayColor: overlayColor,
                                    ),
                                    //Aqui são definidos o que vai compor o botões um texto e um icone
                                    child: Row(
                                      children: [
                                        Text(
                                          MyStrings.proximosSeteDias,
                                          style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0),
                                          textAlign: TextAlign.end,
                                        ),
                                        SizedBox(width: 2),
                                        const Icon(
                                          Icons.navigate_next,
                                          color: MyColors.textColorPrimary,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }else{
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: ContainerShimmerWidget(height: 40),
                              );
                            }
                          }
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder<HourlyWeatherModel>(
                  future: futureHourlyWeather,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      //Este container foi definido com altura fixa por que não é permitido usar o ListView sem definir sua altura
                      return ListHourlyWeatherWidget(
                          hourlyWeatherIsToday: hourlyWeatherIsToday,
                          hourlyWeatherModel: snapshot.data!,
                      );
                    }else{
                      return Padding(
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: ContainerShimmerWidget(height: 100),
                      );
                    }
                  },
                ),
                //Espaço ao final da tela
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}