import 'package:flutter/material.dart';

class AppTheme {
  static const Color azul950 = Color(0xFF0A3047);
  static const Color azul900 = Color(0xFF0F4A6B);
  static const Color azul800 = Color(0xFF0A5A82);
  static const Color azul700 = Color(0xFF076A9D);
  static const Color azul50 = Color(0xFFF0F9FF);
  static const Color blanco = Color(0xFFFFFFFF);

  static final ThemeData themeData = ThemeData().copyWith(
    primaryColor: azul900,
    scaffoldBackgroundColor: azul50,
    appBarTheme: const AppBarTheme(
      backgroundColor: azul900,
      foregroundColor: blanco,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: azul900,
      selectedItemColor: blanco,
      unselectedItemColor: blanco,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: azul800,
      foregroundColor: blanco,
    ),
  );
}
