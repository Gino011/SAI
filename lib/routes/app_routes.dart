import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'home': (context) => const HomeScreen(),
      'recipe': (context) => const RecipeScreen(),
      'profile': (context) => const ProfileScreen(),
      'favorites': (context) => const FavoritesScreen(),
      'history': (context) => const HistoryScreen(),
      'preferences': (context) => const PreferencesScreen(),
      'saved_recipes': (context) => const SavedRecipesScreen(),
    };
  }
}
