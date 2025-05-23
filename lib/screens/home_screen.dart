import 'package:flutter/material.dart';
import '../widgets/seleccion_ingredientes.dart';
import '../widgets/ingredientes_seleccionados.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../themes/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Ingrediente> _ingredientesDisponibles = [
    Ingrediente(nombre: 'Tomate', imagen: 'assets/Ingredientes/Tomate.jpg'),
    Ingrediente(nombre: 'Cebolla', imagen: 'assets/Ingredientes/Cebolla.jpg'),
    Ingrediente(nombre: 'Pollo', imagen: 'assets/Ingredientes/Pollo.jpg'),
    Ingrediente(nombre: 'Arroz', imagen: 'assets/Ingredientes/Arroz.jpg'),
    Ingrediente(nombre: 'Pasta', imagen: 'assets/Ingredientes/Pasta.jpg'),
    Ingrediente(nombre: 'Carne', imagen: 'assets/Ingredientes/Carne.jpg'),
  ];

  final List<Ingrediente> _ingredientesSeleccionados = [];

  void _onIngredienteSeleccionado(Ingrediente ingrediente) {
    setState(() {
      if (ingrediente.seleccionado) {
        _ingredientesSeleccionados.add(ingrediente);
      } else {
        _ingredientesSeleccionados.remove(ingrediente);
      }
    });
  }

  void _onCantidadCambiada(Ingrediente ingrediente, bool incremento) {
    setState(() {
      if (incremento) {
        ingrediente.cantidad++;
      } else if (ingrediente.cantidad > 1) {
        ingrediente.cantidad--;
      }
    });
  }

  void _onIngredienteRemovido(Ingrediente ingrediente) {
    setState(() {
      ingrediente.seleccionado = false;
      _ingredientesSeleccionados.remove(ingrediente);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Selecciona tus ingredientes',
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, 'favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, 'history'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, 'profile'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SeleccionIngredientes(
                ingredientes: _ingredientesDisponibles,
                onIngredienteSeleccionado: _onIngredienteSeleccionado,
                onCantidadCambiada: _onCantidadCambiada,
              ),
            ),
            Expanded(
              flex: 1,
              child: IngredientesSeleccionados(
                ingredientes: _ingredientesSeleccionados,
                onIngredienteRemovido: _onIngredienteRemovido,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            _ingredientesSeleccionados.isEmpty
                ? null
                : () {
                  Navigator.pushNamed(context, 'recipe');
                },
        backgroundColor:
            _ingredientesSeleccionados.isEmpty ? Colors.grey : AppTheme.azul900,
        label: const Text('Buscar Recetas'),
        icon: const Icon(Icons.search),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
