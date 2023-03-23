import 'package:clima/search_city/ui/widgets/search_textfield_widget.dart';
import 'package:clima/search_city/ui/widgets/button_next_widget.dart';
import 'package:clima/shared/ui/widgets/background_widget.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';

//Classe tela de pesquisar cidade
class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({super.key});

  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}
class _SearchCityScreenState extends State<SearchCityScreen> {

  @override
  Widget build(BuildContext context) {

    //Criando variavel que aramzena o tema geral do app criado no arquivo main
    var theme = Theme.of(context);

    return Scaffold(
      //Propriedade impede fundo de se mover quando reclado é ativo
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWidget(),
          //SafeArea para impedir que conteudo fique em cima de elementos da tela como status bar
          SafeArea(
            //Conteudo da tela
            child: Column(
              children: [
                //Definindo espaçamento entre texto e bordas da tela
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child:
                    Text(
                      //Variavel definida no arquivo my_strings
                      MyStrings.vamosPesquisarSuaCidade,
                      //Tema definido no main
                      style: theme.textTheme.titleLarge,
                    )
                ),
                const Center(
                    child: Column(
                      //alinhando eelementos no topo
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          //definindo espaço entre bordas e elemento
                          padding: EdgeInsets.all(20.0),
                          //adicionando text fild de pesquisa personalizado
                          child: SearchTextFieldWidget(),
                        ),
                      ],
                    )
                ),
                //para ocupar espaço da tela e manter o botão alinhado abaixo
                const Expanded(
                  child: Align(
                    // alinhando no centro na parte inferior
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      //definindo espaço entre bordas e elemento
                      padding: EdgeInsets.all(20.0),
                      //adicionando button de pesquisa personalizado
                      child: ButtonNextWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}