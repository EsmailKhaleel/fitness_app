// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:packages_app/Components/drawer.dart';
import 'package:packages_app/fitness_app/Modules/onboarding_screen.dart';
import 'package:packages_app/modules/alarm/alarm.dart';
import 'package:packages_app/modules/heart_bpm/heartScreen.dart';
import 'package:packages_app/modules/homePage/homePage_screen.dart';
import 'package:packages_app/modules/my_expansion_screem.dart';
import 'package:packages_app/modules/onboarding/onboarding_screen.dart';
import 'package:packages_app/modules/registerModule/resgisterScreen.dart';
import 'package:packages_app/modules/users_api/users_local_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoApp',
      theme: ThemeData.light(),
      home:HomePageScreen(),
    );
  }
}
