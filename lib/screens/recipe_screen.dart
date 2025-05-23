import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../themes/app_theme.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo para la receta
    final Map<String, dynamic> receta = {
      'title': 'Pasta Carbonara',
      'imageUrl': 'https://via.placeholder.com/800x400',
      'description':
          'Una deliciosa pasta carbonara tradicional italiana con huevo, queso pecorino y panceta.',
      'tiempoPreparacion': 30,
      'tiempoCoccion': 15,
      'porciones': 4,
      'dificultad': 3,
      'ingredientes': [
        {'nombre': 'Pasta Spaghetti', 'cantidad': '400', 'unidad': 'g'},
        {'nombre': 'Panceta', 'cantidad': '200', 'unidad': 'g'},
        {'nombre': 'Huevos', 'cantidad': '4', 'unidad': 'unidades'},
        {'nombre': 'Queso Pecorino', 'cantidad': '100', 'unidad': 'g'},
        {'nombre': 'Pimienta Negra', 'cantidad': '1', 'unidad': 'cucharadita'},
        {'nombre': 'Sal', 'cantidad': 'al gusto', 'unidad': ''},
      ],
      'pasos': [
        'Cocer la pasta en agua con sal hasta que esté al dente.',
        'Mientras tanto, cortar la panceta en cubos pequeños.',
        'En un bowl, batir los huevos y mezclar con el queso rallado.',
        'Freír la panceta hasta que esté crujiente.',
        'Escurrir la pasta y mezclar con la panceta caliente.',
        'Agregar la mezcla de huevo y queso, removiendo rápidamente.',
        'Servir inmediatamente con pimienta negra recién molida.',
      ],
      'isFavorite': false,
    };

    return Scaffold(
      appBar: CustomAppBar(
        title: receta['title'],
        actions: [
          IconButton(
            icon: Icon(
              receta['isFavorite'] ? Icons.favorite : Icons.favorite_border,
              color: receta['isFavorite'] ? Colors.red : null,
            ),
            onPressed: () {
              // TODO: Implementar lógica de favoritos
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Implementar compartir receta
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la receta
            Image.network(
              receta['imageUrl'],
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.restaurant,
                    size: 100,
                    color: Colors.grey,
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Descripción
                  Text(
                    receta['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Información de tiempo y porciones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _InfoItem(
                        icon: Icons.timer_outlined,
                        label: 'Preparación',
                        value: '${receta['tiempoPreparacion']} min',
                      ),
                      _InfoItem(
                        icon: Icons.restaurant,
                        label: 'Cocción',
                        value: '${receta['tiempoCoccion']} min',
                      ),
                      _InfoItem(
                        icon: Icons.people,
                        label: 'Porciones',
                        value: '${receta['porciones']}',
                      ),
                      _InfoItem(
                        icon: Icons.restaurant_menu,
                        label: 'Dificultad',
                        value:
                            '${'★' * (receta['dificultad'] as int)}${'☆' * (5 - (receta['dificultad'] as int))}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Ingredientes
                  const Text(
                    'Ingredientes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...receta['ingredientes'].map<Widget>((ingrediente) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8),
                          const SizedBox(width: 8),
                          Text(
                            '${ingrediente['nombre']} - ${ingrediente['cantidad']} ${ingrediente['unidad']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 24),

                  // Pasos
                  const Text(
                    'Preparación',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...receta['pasos'].asMap().entries.map<Widget>((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppTheme.azul900,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '${entry.key + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.azul900),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
