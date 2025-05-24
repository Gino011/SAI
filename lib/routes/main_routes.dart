import 'package:flutter/material.dart';
import 'package:sai/models/menu_option.dart';
import 'package:sai/screen/home_screen.dart';


class MainRoutes {
  static final menuOptions = <MenuOption>[
    MenuOption(
      icon: Icon(Icons.home),
      nombre: "Home",
      ruta: "home",
      screen: HomeScreen()
      ),
  ];
}