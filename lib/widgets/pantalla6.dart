import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; // Para el MenuLateral

class PantallaCalendario extends StatelessWidget {
  const PantallaCalendario({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de los días de la semana según tu boceto (D, L, M, M, J, V, S)
    final List<String> diasLetra = ['D', 'L', 'M', 'M', 'J', 'V', 'S'];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      drawer: const MenuLateral(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Calendario',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/comida'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título del mes como en tu dibujo
            const Text(
              'Febrero',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Contenedor principal del calendario (la cuadrícula de tu boceto)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 7 días de la semana
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8, // Para que sean altitos como en tu dibujo
                ),
                itemCount: 28, // Febrero tiene 28 días
                itemBuilder: (context, index) {
                  int dia = index + 1;
                  String letra = diasLetra[index % 7];

                  return Column(
                    children: [
                      Text(
                        '$dia',
                        style: const TextStyle(
                          color: Color(0xFFC0FF00), // Verde lima para los números
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        letra,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                      // Pequeña línea divisoria horizontal
                      const Divider(color: Colors.white10, thickness: 1),
                    ],
                  );
                },
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Espacio inferior del boceto (puedes añadir notas o eventos aquí)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFC0FF00)),
                  SizedBox(width: 15),
                  Text(
                    'No hay eventos para hoy',
                    style: TextStyle(color: Colors.grey),
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