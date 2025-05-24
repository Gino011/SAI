import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../themes/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo para recetas favoritas
    final List<Map<String, dynamic>> recetasFavoritas = [
      {
        'id': '1',
        'titulo': 'Pasta Carbonara',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 30,
        'dificultad': 3,
        'categoria': 'Italiana',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 2)),
      },
      {
        'id': '2',
        'titulo': 'Ensalada César',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 20,
        'dificultad': 2,
        'categoria': 'Ensaladas',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 5)),
      },
      {
        'id': '3',
        'titulo': 'Pollo al Curry',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 45,
        'dificultad': 4,
        'categoria': 'India',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 1)),
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favoritos',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Mostrar filtros
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtros rápidos
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FilterChip(label: 'Todas', isSelected: true),
                _FilterChip(label: 'Italiana'),
                _FilterChip(label: 'Ensaladas'),
                _FilterChip(label: 'India'),
                _FilterChip(label: 'Rápidas'),
                _FilterChip(label: 'Vegetariano'),
              ],
            ),
          ),

          // Lista de recetas favoritas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recetasFavoritas.length,
              itemBuilder: (context, index) {
                final receta = recetasFavoritas[index];
                return _FavoriteRecipeCard(receta: receta);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // TODO: Implementar filtrado
        },
        backgroundColor: Colors.grey[200],
        selectedColor: AppTheme.azul900.withOpacity(0.2),
        checkmarkColor: AppTheme.azul900,
        labelStyle: TextStyle(
          color: isSelected ? AppTheme.azul900 : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _FavoriteRecipeCard extends StatelessWidget {
  final Map<String, dynamic> receta;

  const _FavoriteRecipeCard({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          // TODO: Navegar al detalle de la receta
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Imagen de la receta
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  receta['imagen'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.restaurant,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),

              // Información de la receta
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receta['titulo'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${receta['tiempoPreparacion']} min',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.restaurant_menu,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${'★' * (receta['dificultad'] as int)}${'☆' * (5 - (receta['dificultad'] as int))}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      receta['categoria'],
                      style: TextStyle(
                        color: AppTheme.azul900,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Botones de acción
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // TODO: Quitar de favoritos
                    },
                  ),
                  Text(
                    _getTimeAgo(receta['fechaGuardado']),
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inDays > 0) {
      return 'Hace ${difference.inDays} días';
    } else if (difference.inHours > 0) {
      return 'Hace ${difference.inHours} horas';
    } else if (difference.inMinutes > 0) {
      return 'Hace ${difference.inMinutes} minutos';
    } else {
      return 'Ahora mismo';
    }
  }
}
