import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima/shared/blocs/interpreter_weather_code.dart';
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
          width: 60,
          decoration: BoxDecoration(
            color: time.hour == DateTime.now().hour ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.4),
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
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        time.day == DateTime.now().day && time.hour == DateTime.now().hour ? 'Agora' : DateFormat.Hm().format(time),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      )
                    )
                  ],
                ),
                Image(
                  image: AssetImage('assets/images/${InterpreterWeatherCode.getImgNameWeather(weathercode)}'),
                  width: 40,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    Expanded(
                        child: AutoSizeText(
                          '${temperature.round()}º',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        )
                    )
                  ],
                ),
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