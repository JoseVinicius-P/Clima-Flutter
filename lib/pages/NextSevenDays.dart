import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextSevenDays extends StatefulWidget{
  const NextSevenDays({super.key});

  @override
  State<NextSevenDays> createState() => _NextSevenDays();

}

class _NextSevenDays extends State<NextSevenDays>{
  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Próximos 7 dias',
          style: theme.textTheme.titleSmall,
        ),
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}