import 'package:clima/search_city/ui/SearchCity.dart';
import 'package:flutter/material.dart';
import 'values/MyColors.dart';
import 'values/MyStrings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyStrings.clima,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.textColorPrimary),
        useMaterial3: true,

        //Tema para textos
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 36.0, color: MyColors.textColorPrimary),
          labelSmall: TextStyle(fontSize: 16.2, color: MyColors.textColorGrayLight, fontWeight: FontWeight.normal),
          displayLarge: TextStyle(fontSize: 82.0, color: MyColors.textColorPrimary, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(fontSize: 25.0, color: MyColors.textColorPrimary, fontWeight: FontWeight.normal),
          titleSmall: TextStyle(fontSize: 18.0, color: MyColors.textColorPrimary, fontWeight: FontWeight.normal)
        ),
      ),
      home: const SearchCity(),
    );
  }
}