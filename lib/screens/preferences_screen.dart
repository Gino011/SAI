import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../themes/app_theme.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // Estado de las preferencias
  bool _notificacionesActivas = true;
  bool _modoOscuro = false;
  bool _mostrarTiempoPreparacion = true;
  bool _mostrarDificultad = true;
  String _unidadMedida = 'Métrico';
  String _idioma = 'Español';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Preferencias', showBackButton: true),
      body: ListView(
        children: [
          // Sección de Notificaciones
          _PreferenceSection(
            title: 'Notificaciones',
            icon: Icons.notifications_outlined,
            children: [
              SwitchListTile(
                title: const Text('Activar notificaciones'),
                subtitle: const Text(
                  'Recibe alertas sobre nuevas recetas y actualizaciones',
                ),
                value: _notificacionesActivas,
                onChanged: (bool value) {
                  setState(() {
                    _notificacionesActivas = value;
                  });
                },
              ),
            ],
          ),

          // Sección de Apariencia
          _PreferenceSection(
            title: 'Apariencia',
            icon: Icons.palette_outlined,
            children: [
              SwitchListTile(
                title: const Text('Modo oscuro'),
                subtitle: const Text('Cambia el tema de la aplicación'),
                value: _modoOscuro,
                onChanged: (bool value) {
                  setState(() {
                    _modoOscuro = value;
                  });
                },
              ),
            ],
          ),

          // Sección de Visualización
          _PreferenceSection(
            title: 'Visualización',
            icon: Icons.visibility_outlined,
            children: [
              SwitchListTile(
                title: const Text('Mostrar tiempo de preparación'),
                subtitle: const Text(
                  'Muestra el tiempo estimado en las recetas',
                ),
                value: _mostrarTiempoPreparacion,
                onChanged: (bool value) {
                  setState(() {
                    _mostrarTiempoPreparacion = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Mostrar nivel de dificultad'),
                subtitle: const Text(
                  'Muestra las estrellas de dificultad en las recetas',
                ),
                value: _mostrarDificultad,
                onChanged: (bool value) {
                  setState(() {
                    _mostrarDificultad = value;
                  });
                },
              ),
            ],
          ),

          // Sección de Unidades
          _PreferenceSection(
            title: 'Unidades',
            icon: Icons.straighten_outlined,
            children: [
              RadioListTile<String>(
                title: const Text('Sistema métrico'),
                subtitle: const Text('Gramos, litros, centímetros'),
                value: 'Métrico',
                groupValue: _unidadMedida,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _unidadMedida = value;
                    });
                  }
                },
              ),
              RadioListTile<String>(
                title: const Text('Sistema imperial'),
                subtitle: const Text('Onzas, tazas, pulgadas'),
                value: 'Imperial',
                groupValue: _unidadMedida,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _unidadMedida = value;
                    });
                  }
                },
              ),
            ],
          ),

          // Sección de Idioma
          _PreferenceSection(
            title: 'Idioma',
            icon: Icons.language_outlined,
            children: [
              RadioListTile<String>(
                title: const Text('Español'),
                value: 'Español',
                groupValue: _idioma,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _idioma = value;
                    });
                  }
                },
              ),
              RadioListTile<String>(
                title: const Text('English'),
                value: 'English',
                groupValue: _idioma,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _idioma = value;
                    });
                  }
                },
              ),
            ],
          ),

          // Sección de Datos
          _PreferenceSection(
            title: 'Datos',
            icon: Icons.storage_outlined,
            children: [
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Limpiar caché'),
                subtitle: const Text(
                  'Elimina los datos temporales de la aplicación',
                ),
                onTap: () {
                  // TODO: Implementar limpieza de caché
                },
              ),
              ListTile(
                leading: const Icon(Icons.download_outlined),
                title: const Text('Descargar recetas'),
                subtitle: const Text('Guarda recetas para uso sin conexión'),
                onTap: () {
                  // TODO: Implementar descarga de recetas
                },
              ),
            ],
          ),

          // Sección de Información
          _PreferenceSection(
            title: 'Información',
            icon: Icons.info_outline,
            children: [
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: const Text('Términos y condiciones'),
                onTap: () {
                  // TODO: Mostrar términos y condiciones
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Política de privacidad'),
                onTap: () {
                  // TODO: Mostrar política de privacidad
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Ayuda y soporte'),
                onTap: () {
                  // TODO: Mostrar ayuda
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Acerca de'),
                subtitle: const Text('Versión 1.0.0'),
                onTap: () {
                  // TODO: Mostrar información de la app
                },
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _PreferenceSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _PreferenceSection({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Icon(icon, color: AppTheme.azul900),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}
