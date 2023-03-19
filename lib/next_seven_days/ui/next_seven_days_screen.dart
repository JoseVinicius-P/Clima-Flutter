
import 'package:clima/next_seven_days/ui/widgets/condition_weather_widget.dart';
import 'package:clima/next_seven_days/ui/widgets/day_of_week_widget.dart';
import 'package:flutter/material.dart';

//Classe que é a tela NextSevenDaysScreen, ou Teka dos próximos 7 dias
class NextSevenDaysScreen extends StatefulWidget{
  const NextSevenDaysScreen({super.key});

  @override
  State<NextSevenDaysScreen> createState() => _NextSevenDays();

}

class _NextSevenDays extends State<NextSevenDaysScreen>{
  @override
  Widget build(BuildContext context) {

    //Inicializando tema geral do app
    var theme = Theme.of(context);

    return Scaffold(
      //Faz com que body se posicione sob a appbar
      extendBodyBehindAppBar: true,
      //definindo app bar
      appBar: AppBar(
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
      body: Container(
        //Definindo background que ocupa toda a tela
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          //Definindo espaçamento entre bordas da tela e elementos
          padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
          child: Column(
            children: [
              //Impedindo que elementos fiquem em local errado (statusbar)
              SafeArea(
                child: Container(
                  //Criando container com dados de amanhã
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Amanhã',
                              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            //Adiiconado spacer para ocupar o espaço total entre o primeiro elemento
                            //e outros, permintindo que os proximo elementos fiquem alinhados a direita
                            Spacer(),
                            Text(
                              '25º',
                              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            //Adiicionando espaçamento
                            SizedBox(width: 5),
                            //Definindo imagem relacionada ao tempo
                            Image(
                              image: AssetImage('assets/images/cludy.png'),
                              width: 60,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          //Alinhando todos os filhos no centro
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionWeatherWidget(img_name: 'umbrella.png', dado: '22mm'),
                            SizedBox(width: 30),
                            ConditionWeatherWidget(img_name: 'wind.png', dado: '15km/h'),
                            SizedBox(width: 30),
                            ConditionWeatherWidget(img_name: 'humidity.png', dado: '10%'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Adiiconando dados dos outros dias da semana
              SizedBox(height:30),
              DayOfWeekWidget(dayWeek: 'Segunda', temperature: '25º', img_name: 'cludy.png'),
              SizedBox(height:10),
              DayOfWeekWidget(dayWeek: 'Terça', temperature: '22º', img_name: 'cludy.png'),
              SizedBox(height:10),
              DayOfWeekWidget(dayWeek: 'Quarta', temperature: '30º', img_name: 'cludy.png'),
            ],
          ),
        ),
      ),
    );
  }
}