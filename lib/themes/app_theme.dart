import 'package:flutter/material.dart';

class AppTheme {
  static const Color verde = Color.fromARGB(255, 65, 109, 68);
  static const Color verdeOscuro = Color.fromRGBO(28, 82, 3, 1);
  static const Color bgColor = Color.fromRGBO(59, 158, 64, 1);
  static const Color blanco = Color.fromRGBO(219, 223, 219, 0.996);
  static final ThemeData themeData = ThemeData().copyWith(
    primaryColor: verde,
    scaffoldBackgroundColor: bgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColor,
      selectedItemColor: verdeOscuro,
      unselectedItemColor: blanco,
    ),
  );
}
