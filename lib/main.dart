import 'package:flutter/material.dart';
import 'package:sai/routes/app_routes.dart';
import 'package:sai/routes/main_routes.dart';
import 'package:sai/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context){
    AppRoutes.addRange(MainRoutes.menuOptions);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recetas AI",
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
    );
  }
}