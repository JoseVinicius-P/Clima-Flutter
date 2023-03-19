import 'package:clima/home/ui/Home.dart';
import 'package:clima/values/MyColors.dart';
import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
            minimumSize: const Size(double.infinity, 48)
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
        child: const Text('Continuar'));
  }
}