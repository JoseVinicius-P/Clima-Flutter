import 'package:flutter/material.dart';

//Este widget é usado para expressar 3 informações distintas
//e por isso é usado vezes, ele infoma a quantidade de chuva, o vento e a humidade
class ConditionWeatherWidget extends StatefulWidget {
  //Para reaproveitar o código são solicitados dados do que será exibindo,
  //dessa forma definisse a  imagem, o dados e a descrição do dado
  const ConditionWeatherWidget({
    Key? key,
    required this.string_dado,
    required this.dado,
  }) : super(key: key);

  final String string_dado;
  final String dado;

  @override
  State<ConditionWeatherWidget> createState() => _ConditionWeatherWidgetState();
}

class _ConditionWeatherWidgetState extends State<ConditionWeatherWidget> {

  //Metodo responsavel por definir qual imagem será exibida de acordo com a descrição do dado
  //Este metodo pode ser extraido em um bloc para ser usado em várias telas ou widgets
  String getImage(String string){
    String image;
    if(widget.string_dado == 'Chuva'){
      image = 'umbrella.png';
    }else if(widget.string_dado == 'Vento'){
      image = 'wind.png';
    }else{
      image = 'humidity.png';
    }

    return image;
  }

  @override
  Widget build(BuildContext context) {
    //Obtendo tema geral do app
    var theme = Theme.of(context);

    //Definindo container com background e radius
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius:const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        //definindo espaçamento entre elementos e catainer
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
        //Esta row contem todos os dados
        child: Row(
          children: [
            //Container que contem a imagem com um fundo branco e radius
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0)
                  )
              ),
              child: Padding(
                //Espaçamento entre imagem e container
                padding: const EdgeInsets.all(1.0),
                child: Image(
                  image: AssetImage('assets/images/${getImage(widget.string_dado)}'),
                  width: 40,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            //Espaçamento entre itens
            SizedBox(width: 10),
            Text(
              widget.string_dado,
              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
            ),
            //Este expanded é usado para ocupar todos o espaço e ealinha o texto a direita
            Expanded(
                child: Text(
                  widget.dado,
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
                  textAlign: TextAlign.end,
                )
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}