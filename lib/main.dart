import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchCity(title: 'Flutter Demo Home Page'),
    );
  }
}

class SearchCity extends StatefulWidget {
  const SearchCity({super.key, required this.title});

  final String title;

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    var style = theme.textTheme.displaySmall!.copyWith(
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      body:
      SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child:
                      Text(
                        'Vamos pesquisar uma cidade...',
                        style: style,
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
                ],
              )
          )

    );
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
        color: Colors.white,
      ),
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
          color: Colors.white,
        ),
        hintText: "Pesquisar...",
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.deepOrange.shade200,
      ),
      cursorColor: Colors.white,
    );
  }
}