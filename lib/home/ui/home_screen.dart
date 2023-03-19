
import 'package:clima/home/ui/widgets/condition_weather_widget.dart';
import 'package:clima/home/ui/widgets/time_condition_widget.dart';
import 'package:clima/home/ui/widgets/current_weather_widget.dart';
import 'package:clima/next_seven_days/ui/next_seven_days_screen.dart';
import 'package:clima/values/MyColors.dart';
import 'package:flutter/material.dart';

//Este tela é a principal do app, ele mostra os dados completos de tempo atual
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _Home();

}

class _Home extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {

    //Obtendo tema geral do app
    var theme =  Theme.of(context);

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
              onPressed: (){},
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
          Container(
            //Backgroud que ocupa tanto na largura como na altura o máximo de espaço possivel
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          //Esse SingleChildScrollView é usado para que em caso de telas
          //pesquenas ou em rotação orizontal o usuário consiga rola para ver o conteudo
          SingleChildScrollView(
            child: Column(
              children: [
                //Para conteúdo não ocupar a status bar e app bar
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
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
                        CurrentWeatherWidget(),
                        const SizedBox(height: 70),
                        //Cada item deste define um tipo de condição do tempo
                        ConditionWeatherWidget(string_dado: 'Chuva', dado: '10mm'),
                        const SizedBox(height: 10),
                        ConditionWeatherWidget(string_dado: 'Vento', dado: '10km/h'),
                        const SizedBox(height: 10),
                        ConditionWeatherWidget(string_dado: 'Humidade', dado: '50%'),
                        SizedBox(height: 40),
                        //Este row armazena os botões Hoje, Amanhã e Próximos sete dias
                        Row(
                          children: [
                            //Botão Hoje
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Hoje',
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0, fontWeight: FontWeight.bold),
                              ),
                              //Este código define a cor que será usada em caso de clique do usuário
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                            ),
                            //Espaço entre botões
                            SizedBox(width: 5),
                            //Botão amanhã
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Amanhã',
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0),
                              ),
                              //Este código define a cor que será usada em caso de clique do usuário
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;// Use a cor padrão se não houver nenhuma cor de sobreposição definida
                                  },
                                ),
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
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              //Aqui são definidos o que vai compor o botões um texto e um icone
                              child: Row(
                                children: [
                                  Text(
                                    'Próximos sete dias',
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
                //Este container foi definido com altura fixa por que não é permitido usar o ListView sem definir sua altura
                Container(
                  height: 100,
                  //Este ListView exibirá os dados de tempo por hora
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SizedBox(width: 25.0),
                      //Este widget é usado como um item da lista e nele serão exibidas as informações por hora
                      TimeConditionWidget(),
                      SizedBox(width: 25.0),
                    ],
                  ),
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