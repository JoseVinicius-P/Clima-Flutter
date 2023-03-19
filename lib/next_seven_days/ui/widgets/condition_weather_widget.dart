import 'package:flutter/material.dart';

//Esta classe é usada na tela NextSevenDays como elementos
//que exibem o nivel de chuva velocidade do vendo e humidade
class ConditionWeatherWidget extends StatelessWidget {
  //Recebe-se na instaciação deste widget o nome da imagem
  //salva em assets o dado a ser exibido e o theme geral do app
  const ConditionWeatherWidget({
    super.key,
    required this.img_name,
    required this.dado,
  });

  final String img_name;
  final String dado;

  @override
  Widget build(BuildContext context) {
    //Inicializa tema geral do app
    var theme = Theme.of(context);

    return Column(
      children: [
        Container(
          //Criando um container com fundo branco e bordas arredondadas
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(12.0)
              )
          ),
          child: Padding(
            //Definindo imagem a partir do nome recebido no construtor com espaçamento de 1 e 45 de width
            padding: const EdgeInsets.all(1.0),
            child: Image(
              image: AssetImage('assets/images/$img_name'),
              width: 45,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        //Adicionando espaço entre elementos
        SizedBox(height: 10),
        //exibindo dado recebido no construtor
        Text(
          dado,
          style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
        )
      ],
    );
  }
}