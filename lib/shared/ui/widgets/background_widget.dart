import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final bool isNight;
  const BackgroundWidget({
    super.key,
    required this.isNight,
  });

  @override
  Widget build(BuildContext context) {
    var nameBackground = isNight ? 'background_night' : 'background_day';
    return Container(
      //Backgroud que ocupa tanto na largura como na altura o máximo de espaço possivel
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$nameBackground.jpg'),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}