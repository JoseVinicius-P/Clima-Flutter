import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';

//Classe usada como textfield de pesquisa na tela de pesquisar cidade
class SearchTextFieldWidget extends StatelessWidget {
  //Esta função é recebida quando o item é instaciado, ela permite que o Widget pai possa executar códigos locais através deste widget
  final Function(String) onTextChanged;
  const SearchTextFieldWidget({
    super.key, required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      //Chamando função recebida do widget pai para alterar texto
      onChanged: (text) => onTextChanged(text),
      //definindo estilo do texto
      style: const TextStyle(
        color: MyColors.textColorPrimary,
      ),
      cursorColor: MyColors.textColorPrimary,
      //retirando autocorreção de texto
      autocorrect: false,
      //definindo estilo do container do textfield
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        //definindo icone
        prefixIcon: const Icon(
          Icons.search,
          color: MyColors.textColorPrimary,
        ),
        //Definindo hint usando varivel da classe personalizada MyStrings
        hintText: MyStrings.pesquisar,
        hintStyle: const TextStyle(color: MyColors.textColorPrimary),
        //perimitindo preenchimento do container
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}