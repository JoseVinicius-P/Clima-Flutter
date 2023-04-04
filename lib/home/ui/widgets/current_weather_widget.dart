import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima/shared/blocs/interpreter_weather_code.dart';
import 'package:clima/home/models/current_weather_model.dart';
import 'package:flutter/material.dart';

//Este widget é o principal da tela home_screen,
//exibindo uma imagem temperatura e descrição do tempo grandes
class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeatherModel currentWeather;
  const CurrentWeatherWidget({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {

    //Obtentendo tema geral do app
    var theme = Theme.of(context);

    return Row(
      //Alinhando os dois elementos no centro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Imagem que representa como está o tempo
        Image(
          image: AssetImage('assets/images/${InterpreterWeatherCode.getImgNameWeather(currentWeather.weathercode)}'),
          width: 150,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        //Espaço entre elementos
        SizedBox(width: 15.0),
        Column(
          children: [
            //Esta row contain a temperatura e a unidade de medida
            Row(
              //Alinhando principalmente a unidade de medida no topo
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentWeather.temperature.round().toString(),
                  style: theme.textTheme.displayLarge,
                ),
                Text(
                  'ºC',
                  style: theme.textTheme.labelMedium!.copyWith(fontSize: 22.0),
                )
              ],
            ),
            //Este row contain somente a descrição do clima
            Row(
              children: [
                Container(
                  width: 150,
                  child: AutoSizeText(
                    InterpreterWeatherCode.getDescriptionWeather(currentWeather.weathercode),
                    style: theme.textTheme.labelMedium,
                    maxLines: 2,
                    maxFontSize: 25,
                    minFontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}