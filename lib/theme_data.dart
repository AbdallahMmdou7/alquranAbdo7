import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColorLight,
        unselectedItemColor: AppColors.whiteColor,
        backgroundColor: Colors.transparent),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: AppColors.blackColor,
      ),
      bodyMedium: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: AppColors.blackColor,
      ),
      headlineLarge: GoogleFonts.elMessiri(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}
