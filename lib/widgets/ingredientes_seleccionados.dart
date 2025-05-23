import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'seleccion_ingredientes.dart';

class IngredientesSeleccionados extends StatelessWidget {
  final List<Ingrediente> ingredientes;
  final Function(Ingrediente) onIngredienteRemovido;

  const IngredientesSeleccionados({
    super.key,
    required this.ingredientes,
    required this.onIngredienteRemovido,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredientes Seleccionados',
                  style: TextStyle(
                    color: AppTheme.azul950,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${ingredientes.length} seleccionados',
                  style: TextStyle(color: AppTheme.azul900, fontSize: 14),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child:
                ingredientes.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_basket_outlined,
                            size: 50,
                            color: AppTheme.azul900.withOpacity(0.5),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'No hay ingredientes seleccionados',
                            style: TextStyle(
                              color: AppTheme.azul900.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: ingredientes.length,
                      itemBuilder: (context, index) {
                        final ingrediente = ingredientes[index];
                        return _IngredienteSeleccionadoItem(
                          ingrediente: ingrediente,
                          onRemoved: () => onIngredienteRemovido(ingrediente),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class _IngredienteSeleccionadoItem extends StatelessWidget {
  final Ingrediente ingrediente;
  final VoidCallback onRemoved;

  const _IngredienteSeleccionadoItem({
    required this.ingrediente,
    required this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(ingrediente.nombre),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red.withOpacity(0.2),
        child: Icon(Icons.delete_outline, color: Colors.red[700]),
      ),
      onDismissed: (_) => onRemoved(),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(ingrediente.imagen),
            onBackgroundImageError: (_, __) {},
            child: ingrediente.imagen.isEmpty ? const Icon(Icons.image) : null,
          ),
          title: Text(
            ingrediente.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Cantidad: ${ingrediente.cantidad}',
            style: TextStyle(color: AppTheme.azul900),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.red[700],
            onPressed: onRemoved,
          ),
        ),
      ),
    );
  }
}
