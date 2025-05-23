import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class Subtitle extends StatelessWidget {
  final String titulo;

  const Subtitle({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Text(
        titulo,
        style: TextStyle(
          color: AppTheme.azul950,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
