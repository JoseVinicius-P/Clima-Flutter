
import 'package:flutter/material.dart';

//Este widget é usado na tela NextSevenDays e são
//resposáveis para exibir dados dos dias da semana exceto amanhã
class DayOfWeekWidget extends StatelessWidget {
  //PAra genaralizar este widget são recebidos parametros do que exibir,
  // reaproveitando código
  const DayOfWeekWidget({
    super.key,
    required this.dayWeek,
    required this.temperature,
    required this.img_name,
  });

  final String dayWeek;
  final String temperature;
  final String img_name;

  @override
  Widget build(BuildContext context) {
    //Inicializa tema geral do app
    var theme = Theme.of(context);

    return Container(
      //Definindo container e estilo como fundo branco
      //parcialmente transparente e borda arredondada
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.all(
              Radius.circular(20.0)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          //adicionando elementos que exibirão os dados
          children: [
            Text(
              dayWeek,
              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            //Adiiconado spacer para ocupar o espaço total entre o primeiro elemento
            //e outros, permintindo que os proximo elementos fiquem alinhados a direita
            Spacer(),
            Text(
              temperature,
              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            //Adicionando espaçamento entre elementos
            SizedBox(width: 5),
            //Adiconando imagem que representa como está o tempo
            Image(
              image: AssetImage('assets/images/$img_name'),
              width: 40,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}