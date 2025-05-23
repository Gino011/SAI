import 'package:flutter/material.dart';
import 'package:sai/models/menu_option.dart';
import 'package:sai/screens/home_screen.dart';

class Mainroutes {
  static final menuOptions = <MenuOption>[
    MenuOption(
      nombre: 'home',
      icon: Icons.home,
      ruta: 'home',
      screen: HomeScreen(),
    ),
  ];
}
