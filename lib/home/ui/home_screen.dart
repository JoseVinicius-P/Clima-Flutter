
import 'package:clima/home/models/current_weather_model.dart';
import 'package:clima/home/models/hourly_weather_model.dart';
import 'package:clima/home/repositories/current_weather_api.dart';
import 'package:clima/home/repositories/hourly_weather_api.dart';
import 'package:clima/home/ui/widgets/condition_weather_widget.dart';
import 'package:clima/home/ui/widgets/time_condition_widget.dart';
import 'package:clima/home/ui/widgets/current_weather_widget.dart';
import 'package:clima/search_city/ui/search_city_screen.dart';
import 'package:clima/next_seven_days/ui/next_seven_days_screen.dart';
import 'package:clima/shared/ui/widgets/background_widget.dart';
import 'package:clima/shared/ui/widgets/container_shimmer_widget.dart';
import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//Este tela é a principal do app, ele mostra os dados completos de tempo atual
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _Home();

}

class _Home extends State<HomeScreen>{

  late Future<CurrentWeatherModel> futureCurrentWeather;
  late Future<HourlyWeatherModel> futureHourlyWeather;

  @override
  void initState() {
    super.initState();
    futureCurrentWeather = CurrentWeatherApi().fetchCurrentWeather();
    futureHourlyWeather = HourlyWeatherApi().fetchHourlyWeather();
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

    return Scaffold(
      //Fazendo body ficar sob app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //forçando app bar ficar transparente o tempo todo
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        //Definindo icon que redireciona para tela de buscar cidade
        actions: <Widget> [
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchCityScreen())),
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
          BackgroundWidget(),
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
                            Text(
                              'Iaciara, Goiás',
                              style: theme.textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        //Estes são os dados de data
                        Row(
                          children: [
                            Text(
                              'Seg, 30 jun',
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
                              return ContainerShimmerWidget(height: 170);
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
                        //Este row armazena os botões Hoje, Amanhã e Próximos sete dias
                        Row(
                          children: [
                            //Botão Hoje
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                MyStrings.hoje,
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0, fontWeight: FontWeight.bold),
                              ),
                              //Este código define a cor que será usada em caso de clique do usuário
                              style: ButtonStyle(
                                overlayColor: overlayColor,
                              ),
                            ),
                            //Espaço entre botões
                            SizedBox(width: 5),
                            //Botão amanhã
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                MyStrings.amanha,
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0),
                              ),
                              //Este código define a cor que será usada em caso de clique do usuário
                              style: ButtonStyle(
                                overlayColor: overlayColor,
                              ),
                            ),
                            //Spacer é usado para ocupar todos o espaço forcando o próximo elemento a alinhar-se a direita
                            Spacer(),
                            //Botão Proximos sete dias
                            TextButton(
                              //Redireciona para a tela NextSevenDaysScreen
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NextSevenDaysScreen())),
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
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder<HourlyWeatherModel>(
                  future: futureHourlyWeather,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Container(
                        height: 100,
                        //Este ListView exibirá os dados de tempo por hora
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.time.length,
                          itemBuilder: (context, index){
                            return TimeConditionWidget(
                              time: snapshot.data!.time[index],
                              weathercode: snapshot.data!.weathercode[index],
                              temperature: snapshot.data!.temperature_2m[index]
                            );
                          }
                        )
                      );
                    }else{
                      return SizedBox(height: 100);
                    }
                  },
                ),
    //Este container foi definido com altura fixa por que não é permitido usar o ListView sem definir sua altura

                  /*,ListView(

                    children: const <Widget>[
                      SizedBox(width: 25.0),
                      //Este widget é usado como um item da lista e nele serão exibidas as informações por hora
                      TimeConditionWidget(time: 'Agora', weathercode: 3, temperature: '22',),
                      TimeConditionWidget(time: '21:00', weathercode: 3, temperature: '22',),
                      TimeConditionWidget(time: '22:00', weathercode: 56, temperature: '22',),
                      TimeConditionWidget(time: '23:00', weathercode: 56, temperature: '22',),
                      TimeConditionWidget(time: '00:00', weathercode: 3, temperature: '22',),
                      TimeConditionWidget(time: '01:00', weathercode: 3, temperature: '22',),
                    ],
                  ),*/
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