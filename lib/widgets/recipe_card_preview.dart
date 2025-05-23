import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class RecipeCardPreview extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final int tiempoPreparacion;
  final int dificultad; 
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const RecipeCardPreview({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.tiempoPreparacion,
    required this.dificultad,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.restaurant,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                if (onFavoritePressed != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: onFavoritePressed,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 16,
                        color: AppTheme.azul900,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$tiempoPreparacion min',
                        style: TextStyle(color: AppTheme.azul900, fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.restaurant_menu,
                        size: 16,
                        color: AppTheme.azul900,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Dificultad: ${'★' * dificultad}${'☆' * (5 - dificultad)}',
                        style: TextStyle(color: AppTheme.azul900, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
