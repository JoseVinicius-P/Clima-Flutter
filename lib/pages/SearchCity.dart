import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child:
                  Text(
                    MyStrings.vamosPesquisarSuaCidade,
                    style: theme.textTheme.titleLarge,
                  )
              ),
              const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SearchTextField(),
                      ),
                    ],
                  )
              ),
              const Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ButtonContinuar(),
                      ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonContinuar extends StatelessWidget {
  const ButtonContinuar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: MyColors.whiteTranparent70,
            foregroundColor: MyColors.textColor,
            side: const BorderSide(
              width: 0,
              color: MyColors.whiteTranparent30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 48)
        ),
        onPressed: (){},
        child: const Text('Continuar'));
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style: const TextStyle(
        color: MyColors.textColor,
      ),
      cursorColor: MyColors.textColor,
      autocorrect: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: MyColors.textColor,
        ),
        hintText: MyStrings.pesquisar,
        hintStyle: const TextStyle(color: MyColors.textColor),
        filled: true,
        fillColor: MyColors.whiteTranparent30,
      ),
    );
  }
}