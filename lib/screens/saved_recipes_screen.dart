import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../themes/app_theme.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo para recetas guardadas
    final List<Map<String, dynamic>> recetasGuardadas = [
      {
        'id': '1',
        'titulo': 'Pasta Carbonara',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 30,
        'dificultad': 3,
        'categoria': 'Italiana',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 2)),
        'carpeta': 'Recetas Italianas',
        'notas': 'Ajustar la cantidad de queso',
      },
      {
        'id': '2',
        'titulo': 'Ensalada César',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 20,
        'dificultad': 2,
        'categoria': 'Ensaladas',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 5)),
        'carpeta': 'Ensaladas',
        'notas': 'Agregar pollo a la parrilla',
      },
      {
        'id': '3',
        'titulo': 'Pollo al Curry',
        'imagen': 'https://via.placeholder.com/150',
        'tiempoPreparacion': 45,
        'dificultad': 4,
        'categoria': 'India',
        'fechaGuardado': DateTime.now().subtract(const Duration(days: 1)),
        'carpeta': 'Platos Principales',
        'notas': 'Servir con arroz basmati',
      },
    ];

    // Lista de carpetas disponibles
    final List<String> carpetas = [
      'Todas',
      'Recetas Italianas',
      'Ensaladas',
      'Platos Principales',
      'Postres',
      'Desayunos',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guardadas',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.folder_outlined),
            onPressed: () {
              // TODO: Gestionar carpetas
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Selector de carpetas
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carpetas.length,
              itemBuilder: (context, index) {
                return _FolderChip(
                  label: carpetas[index],
                  isSelected: index == 0,
                );
              },
            ),
          ),

          // Lista de recetas guardadas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recetasGuardadas.length,
              itemBuilder: (context, index) {
                final receta = recetasGuardadas[index];
                return _SavedRecipeCard(receta: receta);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Crear nueva carpeta
        },
        child: const Icon(Icons.create_new_folder),
      ),
    );
  }
}

class _FolderChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FolderChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // TODO: Implementar filtrado por carpeta
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

class _SavedRecipeCard extends StatelessWidget {
  final Map<String, dynamic> receta;

  const _SavedRecipeCard({required this.receta});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        Row(
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              size: 14,
                              color: AppTheme.azul900,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              receta['carpeta'],
                              style: TextStyle(
                                color: AppTheme.azul900,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Botones de acción
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // TODO: Agregar a favoritos
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          // TODO: Eliminar de guardados
                        },
                      ),
                    ],
                  ),
                ],
              ),

              // Notas de la receta
              if (receta['notas'] != null && receta['notas'].isNotEmpty) ...[
                const Divider(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.note_outlined,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        receta['notas'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
