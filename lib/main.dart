import 'package:flutter/material.dart';
// Importamos cada archivo de la carpeta widgets
import 'widgets/inicio.dart';
import 'widgets/pantalla2.dart';
import 'widgets/pantalla3.dart';

void main() {
  runApp(const EasyDietApp());
}

class EasyDietApp extends StatelessWidget {
  const EasyDietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyDiet',
      debugShowCheckedModeBanner: false,
      
      // Configuramos el tema oscuro global para que coincida con el diseño
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFC0FF00), // El verde lima de tus botones
        scaffoldBackgroundColor: const Color(0xFF121212), // Fondo oscuro
        fontFamily: 'Roboto', // O la fuente que prefieras
      ),

      // Definimos la pantalla de inicio
      initialRoute: '/',
      
      // Mapa de navegación (Routes)
      routes: {
        '/': (context) => const Inicio(),
        '/pantalla2': (context) => const Pantalla3(), // Ahora la 2 es la receta (Huevo con Espinaca)
        '/pantalla3': (context) => const Pantalla2(), // Ahora la 3 es la de Planes
      },
    );
  }
}