import 'package:flutter/material.dart';

// --- 2. PANTALLA DE REGISTRO ---
class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            _campoTexto(Icons.person, 'Nombre y Apellido'),
            _campoTexto(Icons.email, 'Correo Electrónico'),
            _campoTexto(Icons.lock, 'Contraseña', ocultar: true),
            _campoTexto(Icons.lock_outline, 'Confirmar Contraseña', ocultar: true),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC0FF00),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/inicio'),
                child: const Text('Registrarse', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campoTexto(IconData icono, String hint, {bool ocultar = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: ocultar,
        decoration: InputDecoration(
          prefixIcon: Icon(icono, color: Colors.white54),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
