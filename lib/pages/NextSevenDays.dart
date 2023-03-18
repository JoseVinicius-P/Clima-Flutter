import 'package:clima/values/MyColors.dart';
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
    final String img_name = 'umbrella.png';
    final String dado = '22mm';

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
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.whiteTranparent70,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Amanhã',
                              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '25º',
                              style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Image(
                              image: AssetImage('assets/images/cludy.png'),
                              width: 60,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionWeather(img_name: 'umbrella.png', dado: '22mm', theme: theme),
                            SizedBox(width: 30),
                            ConditionWeather(img_name: 'wind.png', dado: '15km/h', theme: theme),
                            SizedBox(width: 30),
                            ConditionWeather(img_name: 'humidity.png', dado: '10%', theme: theme),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConditionWeather extends StatelessWidget {
  const ConditionWeather({
    super.key,
    required this.img_name,
    required this.dado,
    required this.theme,
  });

  final String img_name;
  final String dado;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(12.0)
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image(
              image: AssetImage('assets/images/$img_name'),
              width: 45,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          dado,
          style: theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
        )
      ],
    );
  }
}