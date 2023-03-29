import 'package:clima/home/ui/home_screen.dart';
import 'package:clima/search_city/repositories/search_city_api.dart';
import 'package:clima/search_city/ui/widgets/search_textfield_widget.dart';
import 'package:clima/shared/ui/widgets/background_widget.dart';
import 'package:clima/search_city/models/city_model.dart';
import 'package:clima/shared/ui/widgets/container_shimmer_widget.dart';
import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';

//Classe tela de pesquisar cidade
class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({super.key});

  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}
class _SearchCityScreenState extends State<SearchCityScreen> {
  late Future<List<CityModel>> futureCities = Future.value([]);
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
    //futureCities = SearchCityApi().fetchCities(search: 'iac');
  }

  void updateSearch(String text) {
    setState(() {
      //Essa key é criada para o FutureBuilder sempre atualizar quando o estado for atualizado
      key = UniqueKey();
      //Alterando resultados da api quando usuário digitar
      futureCities = SearchCityApi().fetchCities(search: text);
    });
  }

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
            child: Stack(
              children: [
                Column(
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
                    Center(
                        child: Column(
                          //alinhando eelementos no topo
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              //definindo espaço entre bordas e elemento
                              padding: EdgeInsets.all(20.0),
                              //adicionando text fild de pesquisa personalizado
                              child: SearchTextFieldWidget(
                                //Passando função para que o SearchTextFieldWidget consiga a executar de outro arquivo
                                onTextChanged: (text) => updateSearch(text),
                              ),
                            ),
                            FutureBuilder<List<CityModel>>(
                              key: key,
                              future: futureCities,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Container(
                                    child:
                                      ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index){
                                          return Padding(
                                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => HomeScreen(
                                                              nameCity: snapshot.data![index].name,
                                                              country: snapshot.data![index].country,
                                                              latitude: snapshot.data![index].latitude,
                                                              longitude: snapshot.data![index].longitude
                                                            )
                                                        )
                                                    );
                                                  },
                                                  child: Text(
                                                    '${snapshot.data![index].name}, ${snapshot.data![index].country}',
                                                    style: theme.textTheme.titleSmall,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: MyColors.textColorPrimary.withOpacity(0.1),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                  );
                                }else{
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: Column(
                                      children: [
                                        ContainerShimmerWidget(height: 35),
                                        SizedBox(height: 10),
                                        ContainerShimmerWidget(height: 35),
                                        SizedBox(height: 10),
                                        ContainerShimmerWidget(height: 35),
                                        SizedBox(height: 10),
                                      ],
                                    )
                                  );
                                }
                              },
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}