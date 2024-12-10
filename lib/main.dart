import 'package:alquran/home_screen.dart';
import 'package:alquran/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {HomeScreen.routName: (context) => const HomeScreen()},
    );
  }
}
