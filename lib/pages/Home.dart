
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
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/cludy.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}