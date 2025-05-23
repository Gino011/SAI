import 'package:flutter/widgets.dart';

class MenuOption {
  final String ruta;
  final IconData icon;
  final String nombre;
  final Widget screen;

  MenuOption({
    required this.ruta,
    required this.icon,
    required this.nombre,
    required this.screen,
  });

  @override
  String toString() => nombre;
}
