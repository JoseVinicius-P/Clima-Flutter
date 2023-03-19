
import 'package:clima/next_seven_days/ui/next_seven_days_screen.dart';
import 'package:clima/values/MyColors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _Home();

}

class _Home extends State<Home>{

  @override
  Widget build(BuildContext context) {

    var theme =  Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget> [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
                    child:  Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Iaciara, Goiás',
                              style: theme.textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Seg, 30 jun',
                              style: theme.textTheme.labelSmall,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        CurrentWeatherLayout(theme: theme),
                        const SizedBox(height: 70),
                        ConditionWeather(string_dado: 'Chuva', theme: theme, dado: '10mm'),
                        const SizedBox(height: 10),
                        ConditionWeather(string_dado: 'Vento', theme: theme, dado: '10km/h'),
                        const SizedBox(height: 10),
                        ConditionWeather(string_dado: 'Humidade', theme: theme, dado: '50%'),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Hoje',
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;// Use a cor padrão se não houver nenhuma cor de sobreposição definida
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Amanhã',
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;// Use a cor padrão se não houver nenhuma cor de sobreposição definida
                                  },
                                ),
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NextSevenDaysScreen())),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return MyColors.textColorPrimary.withOpacity(0.2);
                                    }
                                    return Colors.transparent;// Use a cor padrão se não houver nenhuma cor de sobreposição definida
                                  },
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Próximos sete dias',
                                    style: theme.textTheme.labelMedium?.copyWith(fontSize: 13.0),
                                    textAlign: TextAlign.end,
                                  ),
                                  SizedBox(width: 2),
                                  const Icon(
                                    Icons.navigate_next,
                                    color: MyColors.textColorPrimary,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SizedBox(width: 25.0),
                      TimeCondition(),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
      ),

    );
  }

}

class CurrentWeatherLayout extends StatelessWidget {
  const CurrentWeatherLayout({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/cludy.png'),
          width: 150,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(width: 15.0),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '19',
                  style: theme.textTheme.displayLarge,
                ),
                Text(
                  'ºC',
                  style: theme.textTheme.labelMedium!.copyWith(fontSize: 22.0),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Chuvoso',
                  style: theme.textTheme.labelMedium,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ConditionWeather extends StatefulWidget {
  const ConditionWeather({
    Key? key,
    required this.string_dado,
    required this.theme,
    required this.dado,
  }) : super(key: key);

  final String string_dado;
  final ThemeData theme;
  final String dado;

  @override
  State<ConditionWeather> createState() => _ConditionWeatherState();
}

class _ConditionWeatherState extends State<ConditionWeather> {

  String getImage(String string){
    String image;
    if(widget.string_dado == 'Chuva'){
      image = 'umbrella.png';
    }else if(widget.string_dado == 'Vento'){
      image = 'wind.png';
    }else{
      image = 'humidity.png';
    }

    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius:const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
        child: Row(
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
                  image: AssetImage('assets/images/${getImage(widget.string_dado)}'),
                  width: 40,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              widget.string_dado,
              style: widget.theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
            ),
            Expanded(
              child: Text(
                widget.dado,
                style: widget.theme.textTheme.labelMedium?.copyWith(fontSize: 15.0),
                textAlign: TextAlign.end,
              )
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class TimeCondition extends StatelessWidget {
  const TimeCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Agora'),
                Image(
                  image: AssetImage('assets/images/cludy.png'),
                  width: 40,
                  fit: BoxFit.cover,
                ),
                Text('25º')
              ],
            ),
          ),

        ),
        const SizedBox(width: 5.0),
      ],
    );
  }
}