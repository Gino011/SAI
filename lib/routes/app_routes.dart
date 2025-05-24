import 'package:flutter/material.dart';
import 'package:sai/models/menu_option.dart';

// Clase que gestiona las rutas principales de la aplicación
class AppRoutes {
    // Ruta inicial de la aplicación
    static final initialRoute = "home";
    // Lista estática de opciones de menú (cada una representa una ruta)
    static final menuOptions = <MenuOption>[];

    // Método para agregar varias opciones de menú a la lista
    static addRange(List<MenuOption> options){
      menuOptions.addAll(options);
    }

    // Método para agregar una sola opción de menú a la lista
    static add(MenuOption option){
      menuOptions.add(option);
    }

    // Método que mapea las rutas de menuOptions y las retorna como un Map
    static Map<String, Widget Function(BuildContext)> getRoutes(){
      // Mapa vacío donde se guardarán las rutas
      Map<String, Widget Function(BuildContext)> routes = {};

      // Itera sobre cada opción de menú y la agrega al mapa de rutas
      for(var menu in menuOptions){
        routes.addAll({
          // La clave es el nombre de la ruta, el valor es una función que retorna el widget (pantalla)
          menu.ruta: (BuildContext context) => menu.screen
        });
      }
      // Retorna el mapa de rutas configurado
      return routes;
    }
}