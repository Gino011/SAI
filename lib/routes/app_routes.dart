import 'package:flutter/material.dart';
import 'package:sai/models/menu_option.dart';

class AppRoutes {
  static final initialRoute = "home";
  static final menuOptions = <MenuOption>[];

  static addRange(List<MenuOption> options) {
    menuOptions.addAll(options);
  }

  static add(MenuOption option) {
    menuOptions.add(option);
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    for (var menu in menuOptions) {
      routes.addAll({menu.ruta: (BuildContext context) => menu.screen});
    }

    return routes;
  }
}
