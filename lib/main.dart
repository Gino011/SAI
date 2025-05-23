import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutri App',
      theme: AppTheme.themeData,
      initialRoute: "home",
      routes: AppRoutes.getRoutes(),
    );
  }
}
