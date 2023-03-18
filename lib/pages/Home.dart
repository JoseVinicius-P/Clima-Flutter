
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
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
                SizedBox(height: 15.0),
                CurrentWeatherLayout(theme: theme),
                SizedBox(height: 70),
                Container(
                  decoration: const BoxDecoration(
                    color: MyColors.whiteTranparent70,
                    borderRadius:BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(17.0)
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Image(
                              image: AssetImage('assets/images/cludy.png'),
                              width: 50,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
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