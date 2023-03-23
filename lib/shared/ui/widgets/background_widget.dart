import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //Backgroud que ocupa tanto na largura como na altura o máximo de espaço possivel
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}