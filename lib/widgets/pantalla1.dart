import 'package:flutter/material.dart';

// --- 1. PANTALLA DE BIENVENIDA ---
class PantallaBienvenida extends StatelessWidget {
  const PantallaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'EasyDiet',
              style: TextStyle(fontSize: 32, color: Color(0xFFC0FF00), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // Simulación de la imagen central
            const Icon(Icons.apple, size: 160, color: Colors.lime),
            const SizedBox(height: 40),
            const Text('Tu guía para una vida saludable.', textAlign: TextAlign.center),
            const SizedBox(height: 60),
            _botonPrincipal(context, 'Iniciar Sesión', '/inicio', true),
            const SizedBox(height: 15),
            _botonPrincipal(context, 'Crear Cuenta', '/registro', false),
          ],
        ),
      ),
    );
  }

  Widget _botonPrincipal(BuildContext context, String texto, String ruta, bool esVerde) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: esVerde ? const Color(0xFFC0FF00) : const Color(0xFF2C2C2C),
          foregroundColor: esVerde ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () => Navigator.pushNamed(context, ruta),
        child: Text(texto, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}