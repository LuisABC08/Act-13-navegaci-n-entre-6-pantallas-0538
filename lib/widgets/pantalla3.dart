import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mantenemos el menú lateral funcional
      drawer: const MenuLateral(),

      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          // Cambiamos el Icon por un IconButton para darle funcionalidad
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Navegación a la pantalla de comida desde la campana
              Navigator.pushNamed(context, '/comida');
            },
          ),
          const SizedBox(width: 5), // Ajustado un poco el espacio
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hola, Luis Alberto Cazares Banda del 6-i ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Bienvenido de nuevo',
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 25),
            const Text(
              'Tu Plan de Hoy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Fila de Comidas (Scroll Horizontal)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _tarjetaComida(
                    context,
                    'Desayuno',
                    '350 cal.',
                    'Smoothie Bowl',
                    'https://images.unsplash.com/photo-1525351484163-7529414344d8?q=80&w=2080&auto=format&fit=crop',
                  ),
                  _tarjetaComida(
                    context,
                    'Almuerzo',
                    '600 cal.',
                    'Pollo a la Parrilla',
                    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=2070&auto=format&fit=crop',
                  ),
                  _tarjetaComida(
                    context,
                    'Cena',
                    '400 cal.',
                    'Ensalada Quinoa',
                    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            _botonOpcion(Icons.bar_chart, 'Progreso Semanal'),
            _botonOpcion(Icons.restaurant_menu, 'Recetas Saludables'),
          ],
        ),
      ),
    );
  }

  Widget _tarjetaComida(
    BuildContext context,
    String tiempo,
    String cal,
    String desc,
    String imageUrl,
  ) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 90,
                color: Colors.grey[800],
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tiempo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  cal,
                  style: const TextStyle(
                    color: Color(0xFFC0FF00),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 10, color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botonOpcion(IconData icono, String titulo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icono, color: Colors.white),
          const SizedBox(width: 15),
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.white54),
        ],
      ),
    );
  }
}
