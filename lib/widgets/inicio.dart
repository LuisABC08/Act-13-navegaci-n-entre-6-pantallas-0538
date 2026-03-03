import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'EasyDiet',
              style: TextStyle(
                color: Color(0xFFC0FF00), // Tu verde lima característico
                fontSize: 32, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            
            // --- CAMBIO DE ICONO AQUÍ ---
            // Usamos un icono de hoja/fruta con el color de la marca
            const Icon(
              Icons.apple, // Un icono que representa lo saludable/natural
              size: 150,
              color: Color(0xFFC0FF00),
            ),
            
            const SizedBox(height: 40),
            const Text(
              'Tu guía para una vida saludable.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 60),
            
            // Botón Iniciar Sesión
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC0FF00),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
  Navigator.pushNamed(context, '/pantalla2'); // Esto ahora abrirá la receta
},
              child: const Text(
                'Iniciar Sesión', 
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 15),
            
            // Botón Crear Cuenta
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF2C2C2C),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
              child: const Text(
                'Crear Cuenta', 
                style: TextStyle(color: Colors.white, fontSize: 18)
              ),
            ),
          ],
        ),
      ),
    );
  }
}