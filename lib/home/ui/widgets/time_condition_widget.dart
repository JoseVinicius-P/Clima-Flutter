import 'package:clima/home/blocs/interpreter_weather_code.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Este widget é usado para listar a previsão do tempo por hora na tela home_screen
class TimeConditionWidget extends StatelessWidget {
  final DateTime time;
  final int weathercode;
  final double temperature;
  const TimeConditionWidget({
    super.key, required this.time, required this.weathercode, required this.temperature,
  });
  
  

  @override
  Widget build(BuildContext context) {
    //Esta linha é usada para conseguir colocar espaçamentos entre os itens da lista
    return Row(
      children: [
        //espaçamento entre os itens
        const SizedBox(width: 5.0),
        //definindo fundo e radius do container do item
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              //alinhando filhos para que ocupem o espaço no elemento uniformemente
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ocupando o espaço total da lista
              mainAxisSize: MainAxisSize.max,
              children: [
                //Exibindo informações do tempo em determinada hora
                Text(DateFormat.Hm().format(time)),
                Image(
                  image: AssetImage('assets/images/${InterpreterWeatherCode.getImgNameWeather(weathercode)}'),
                  width: 40,
                  fit: BoxFit.cover,
                ),
                Text('${temperature.round()}º')
              ],
            ),
          ),

        ),
        //Espaçamento entre do itens
        const SizedBox(width: 5.0),
      ],
    );
  }
}