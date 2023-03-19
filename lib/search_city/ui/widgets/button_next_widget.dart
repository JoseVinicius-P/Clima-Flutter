import 'package:clima/home/ui/home_screen.dart';
import 'package:clima/values/MyColors.dart';
import 'package:flutter/material.dart';

//Classe botão usado na tela de pesquisa de cidade
class ButtonNextWidget extends StatelessWidget {
  const ButtonNextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      //definindo estilo
        style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: Colors.white.withOpacity(0.4),
            foregroundColor: MyColors.textColorPrimary,
            side: BorderSide(
              width: 0,
              color: Colors.white.withOpacity(0.3),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //definindo width para preencher toda a tela e heigth como 48
            minimumSize: const Size(double.infinity, 48)
        ),
        // Redirecionando para tela Home quando clicado
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
        child: const Text('Continuar'));
  }
}