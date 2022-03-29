
import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Climate());
}
class Climate extends StatelessWidget {
  const Climate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => LoadingScreen(),
        '/city':(context) => CityScreen(),
        '/navigation':(context)=> LoadingScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
   
    );
  }
}

