import 'package:flutter/material.dart';
// Importación de tus pantallas (asegúrate de que los nombres de archivo coincidan)
import 'package:myapp/widgets/pantalla1.dart'; // Bienvenida
import 'package:myapp/widgets/pantalla2.dart'; // Registro
import 'package:myapp/widgets/pantalla3.dart'; // Inicio
import 'package:myapp/widgets/pantalla4.dart'; // Planes (A crear)
import 'package:myapp/widgets/pantalla5.dart'; // Comida (A crear)
import 'package:myapp/widgets/pantalla6.dart'; // Calendario (A crear)

void main() {
  runApp(const EasyDietApp());
}

class EasyDietApp extends StatelessWidget {
  const EasyDietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyDiet',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFC0FF00), // Verde lima
        hintColor: const Color(0xFFC0FF00),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFFC0FF00)), // Iconos en lima
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaBienvenida(),
        '/registro': (context) => const PantallaRegistro(),
        '/inicio': (context) => const PantallaInicio(),
        '/planes': (context) => const PantallaPlanes(),
        '/comida': (context) => const PantallaComida(),
        '/calendario': (context) => const PantallaCalendario(),
      },
    );
  }
}

// --- Widget Global para el Menú Hamburguesa ---
// Podrás llamarlo desde cualquier pantalla con: drawer: const MenuLateral()
class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF121212),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1E1E1E)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFC0FF00),
                  radius: 30,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text('Menú EasyDiet', style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          _itemMenu(context, Icons.home, 'Inicio', '/inicio'),
          _itemMenu(context, Icons.calendar_today, 'Calendario', '/calendario'),
          _itemMenu(context, Icons.list_alt, 'Planes', '/planes'),
          const Divider(color: Colors.white24),
          _itemMenu(context, Icons.logout, 'Cerrar Sesión', '/'),
        ],
      ),
    );
  }

  Widget _itemMenu(BuildContext context, IconData icono, String titulo, String ruta) {
    return ListTile(
      leading: Icon(icono, color: const Color(0xFFC0FF00)),
      title: Text(titulo, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // Cierra el drawer
        Navigator.pushReplacementNamed(context, ruta);
      },
    );
  }
}