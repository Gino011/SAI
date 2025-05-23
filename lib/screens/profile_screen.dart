import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../themes/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo del usuario
    final Map<String, dynamic> usuario = {
      'nombre': 'Juan Pérez',
      'email': 'juan.perez@email.com',
      'foto': 'https://via.placeholder.com/150',
      'recetasCreadas': 15,
      'recetasGuardadas': 28,
      'seguidores': 156,
      'siguiendo': 89,
    };

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Perfil',
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navegar a configuración
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sección de información del perfil
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Foto de perfil
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(usuario['foto']),
                    onBackgroundImageError: (_, __) {},
                    child:
                        usuario['foto'].isEmpty
                            ? const Icon(Icons.person, size: 50)
                            : null,
                  ),
                  const SizedBox(height: 16),

                  // Nombre y email
                  Text(
                    usuario['nombre'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    usuario['email'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),

                  // Botón de editar perfil
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implementar edición de perfil
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar Perfil'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.azul900,
                      side: BorderSide(color: AppTheme.azul900),
                    ),
                  ),
                ],
              ),
            ),

            // Estadísticas
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatItem(
                    icon: Icons.restaurant_menu,
                    label: 'Recetas',
                    value: usuario['recetasCreadas'].toString(),
                  ),
                  _StatItem(
                    icon: Icons.bookmark,
                    label: 'Guardadas',
                    value: usuario['recetasGuardadas'].toString(),
                  ),
                  _StatItem(
                    icon: Icons.people,
                    label: 'Seguidores',
                    value: usuario['seguidores'].toString(),
                  ),
                  _StatItem(
                    icon: Icons.person_add,
                    label: 'Siguiendo',
                    value: usuario['siguiendo'].toString(),
                  ),
                ],
              ),
            ),

            // Opciones del perfil
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Opciones',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _ProfileOption(
                    icon: Icons.history,
                    title: 'Historial de Recetas',
                    onTap: () {
                      // TODO: Navegar al historial
                    },
                  ),
                  _ProfileOption(
                    icon: Icons.favorite,
                    title: 'Recetas Favoritas',
                    onTap: () {
                      // TODO: Navegar a favoritos
                    },
                  ),
                  _ProfileOption(
                    icon: Icons.bookmark,
                    title: 'Recetas Guardadas',
                    onTap: () {
                      // TODO: Navegar a guardadas
                    },
                  ),
                  _ProfileOption(
                    icon: Icons.settings,
                    title: 'Configuración',
                    onTap: () {
                      // TODO: Navegar a configuración
                    },
                  ),
                  _ProfileOption(
                    icon: Icons.help_outline,
                    title: 'Ayuda y Soporte',
                    onTap: () {
                      // TODO: Navegar a ayuda
                    },
                  ),
                  _ProfileOption(
                    icon: Icons.logout,
                    title: 'Cerrar Sesión',
                    onTap: () {
                      // TODO: Implementar cierre de sesión
                    },
                    textColor: Colors.red,
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

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
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
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppTheme.azul900),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
