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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF313341)),
        useMaterial3: true,

        //Tema para textos
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 36.0, color: Color(0xFF313341)),
        )
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

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child:
                Text(
                  'Vamos pesquisar uma cidade...',
                  style: theme.textTheme.titleLarge,
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
        ),
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

    var theme = Theme.of(context);

    return TextFormField(
      style: const TextStyle(
        color: Color(0xFF313341),
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
          color: Color(0xFF313341),
        ),
        hintText: "Pesquisar...",
        hintStyle: const TextStyle(color: Color(0xFF313341)),
        filled: true,
        fillColor: const Color(0x30FFFFFF),
      ),
      cursorColor: Colors.white,
    );
  }
}