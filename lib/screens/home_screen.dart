import 'package:flutter/material.dart';
import 'package:sai/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NUTRI APP + IA'),
        backgroundColor: AppTheme.verdeOscuro,
      ),
    );
  }
}
