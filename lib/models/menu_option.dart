import 'package:flutter/material.dart';

class MenuOption {
  final String ruta;
  final Icon icon;
  final String nombre;
  final Widget screen;

  MenuOption({
    required this.ruta,
    required this.icon,
    required this.nombre,
    required this.screen
  });

  @override
  String toString() => nombre;
}