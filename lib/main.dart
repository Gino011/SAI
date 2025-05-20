import 'package:flutter/material.dart';
import 'package:sai/routes/mainRoutes.dart';
import 'package:sai/themes/app_theme.dart';
import 'package:sai/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRoutes.addRange(Mainroutes.menuOptions);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutri APP',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
    );
  }
}
