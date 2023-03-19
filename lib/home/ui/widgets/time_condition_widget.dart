import 'package:flutter/material.dart';

//Este widget é usado para listar a previsão do tempo por hora na tela home_screen
class TimeConditionWidget extends StatelessWidget {
  const TimeConditionWidget({
    super.key,
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
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              //alinhando filhos para que ocupem o espaço no elemento uniformemente
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ocupando o espaço total da lista
              mainAxisSize: MainAxisSize.max,
              children: [
                //Exibindo informações do tempo em determinada hora
                Text('Agora'),
                Image(
                  image: AssetImage('assets/images/cludy.png'),
                  width: 40,
                  fit: BoxFit.cover,
                ),
                Text('25º')
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