// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:homila_ai/ChangesDuringPregnancyScreen.dart';
import 'package:homila_ai/HomeScreen.dart';
import 'package:homila_ai/TestScreen.dart';
import 'package:homila_ai/LocationsScreen.dart';
// import 'package:cin_risk/PollingScreen.dart';
// import 'package:pedometr/ResultScreen.dart';
// import 'package:pedometr/UsefulInfoScreen.dart';
// import 'package:pedometr/pedometr.dart';

void main() async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home' : (context) => HomeScreen(),
      '/test' : (context) => TestScreen(),
      '/locations' : (context) => LocationsScreen(),
      '/changes' : (context) => ChangesDuringPregnancyScreen(),
      // '/result' : (context) => ResultScreen(),
      // '/usefulinfo' : (context) => UsefulInfoScreen(),
    },
  ));
}