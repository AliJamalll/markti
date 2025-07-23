import 'package:flutter/material.dart';
import 'package:markti/core/constants/colors.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: appColors.KPprimary,
  scaffoldBackgroundColor: appColors.KPwhite,
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.KPwhite,
    iconTheme: IconThemeData(color: appColors.KPnavy),
    titleTextStyle: TextStyle(color: appColors.KPnavy, fontSize: 20),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: appColors.KPwhite,
    selectedItemColor: appColors.KPprimary,
    unselectedItemColor: appColors.KPnavy,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    showUnselectedLabels: true,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    background: appColors.KPwhite,
    primary: appColors.KPprimary,
    secondary: appColors.KPnavy,
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    showUnselectedLabels: true,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey,
  ),
);
