import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_spire_practice/screens/profile_screen.dart';
import 'package:travel_spire_practice/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
