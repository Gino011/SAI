import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class Ingrediente {
  final String nombre;
  final String imagen;
  bool seleccionado;
  int cantidad;

  Ingrediente({
    required this.nombre,
    required this.imagen,
    this.seleccionado = false,
    this.cantidad = 1,
  });
}

class SeleccionIngredientes extends StatelessWidget {
  final List<Ingrediente> ingredientes;
  final Function(Ingrediente) onIngredienteSeleccionado;
  final Function(Ingrediente, bool) onCantidadCambiada;

  const SeleccionIngredientes({
    super.key,
    required this.ingredientes,
    required this.onIngredienteSeleccionado,
    required this.onCantidadCambiada,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecciona tus ingredientes",
            style: TextStyle(
              color: AppTheme.azul950,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: ingredientes.length,
              itemBuilder: (context, index) {
                final ingrediente = ingredientes[index];
                return _IngredienteCard(
                  ingrediente: ingrediente,
                  onSeleccionado: (seleccionado) {
                    ingrediente.seleccionado = seleccionado;
                    onIngredienteSeleccionado(ingrediente);
                  },
                  onCantidadCambiada: (incremento) {
                    onCantidadCambiada(ingrediente, incremento);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredienteCard extends StatelessWidget {
  final Ingrediente ingrediente;
  final Function(bool) onSeleccionado;
  final Function(bool) onCantidadCambiada;

  const _IngredienteCard({
    required this.ingrediente,
    required this.onSeleccionado,
    required this.onCantidadCambiada,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  child: Image.asset(
                    ingrediente.imagen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image, size: 100);
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Checkbox(
                    value: ingrediente.seleccionado,
                    onChanged: (value) => onSeleccionado(value ?? false),
                    activeColor: AppTheme.azul900,
                    checkColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ingrediente.nombre,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed:
                            ingrediente.cantidad > 1
                                ? () => onCantidadCambiada(false)
                                : null,
                        color: AppTheme.azul900,
                      ),
                      Text(
                        '${ingrediente.cantidad}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => onCantidadCambiada(true),
                        color: AppTheme.azul900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
