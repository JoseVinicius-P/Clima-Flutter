import 'package:clima/home/ui/home_screen.dart';
import 'package:clima/next_seven_days/ui/next_seven_days_screen.dart';
import 'package:clima/search_city/models/city_model.dart';
import 'package:clima/search_city/ui/search_city_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'values/MyColors.dart';
import 'values/MyStrings.dart';

void main() async{
  // Inicializa o SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefsCity = await SharedPreferences.getInstance();
  runApp(MyApp(prefsCity: prefsCity));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefsCity;
  const MyApp({
    super.key,
    required this.prefsCity,
  });


  bool isCitySaved() {
    if(prefsCity.containsKey('name')
        && prefsCity.containsKey('latitude')
        && prefsCity.containsKey('longitude')
        && prefsCity.containsKey('timezone')
        && prefsCity.containsKey('country')
    ) {
      return true;
    }else {
      return false;
    }
  }

  CityModel getCity(){
      CityModel city = CityModel(
          name: prefsCity.getString('name')!,
          latitude: prefsCity.getDouble('latitude')!,
          longitude: prefsCity.getDouble('longitude')!,
          timezone: prefsCity.getString('timezone')!,
          country: prefsCity.getString('country')!);
      return city;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyStrings.clima,
      routes: {
        '/homeScreen': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return HomeScreen(
              name: args['name'],
              country: args['country'],
              longitude: args['longitude'],
              latitude: args['latitude'],
              timezone: args['timezone']
          );
        },
        '/searchCityScreen': (context) => const SearchCityScreen(),
        '/nextSevenDaysScreen' : (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return NextSevenDaysScreen(
              longitude: args['longitude'],
              latitude: args['latitude'],
              timezone: args['timezone']
          );
        },
      },
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
      home: isCitySaved() ? HomeScreen(
          name: getCity().name,
          country: getCity().country,
          longitude: getCity().longitude,
          latitude: getCity().latitude,
          timezone: getCity().timezone)
          : const SearchCityScreen(),
    );
  }
}