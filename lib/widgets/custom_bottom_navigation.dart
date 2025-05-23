import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppTheme.azul900,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historial"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
      onTap: onTap,
    );
  }
}
