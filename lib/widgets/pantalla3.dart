import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // Vuelve al Inicio
        ),
        title: const Text(
          'Comida',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // AHORA LA CAMPANA TE LLEVA A LOS PLANES (Pantalla 2)
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/pantalla3'); // Ruta hacia Planes
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // El icono de menú verde de tu dibujo
            const SizedBox(height: 15),

            const Text(
              'Huevo Con Espinaca',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Contenedor de imagen con el vaso de agua
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1525351484163-7529414344d8?q=80&w=500',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent.withOpacity(0.5),
                        ),
                      ),
                      child: const Icon(
                        Icons.local_drink,
                        color: Colors.blueAccent,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),
            const Text(
              'Ingredientes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Color(0xFFC0FF00),
              thickness: 3,
              endIndent: 280,
            ),

            const SizedBox(height: 20),
            _buildIngrediente('2 Huevos orgánicos'),
            _buildIngrediente('1 Taza de espinacas frescas'),
            _buildIngrediente('Sal y pimienta al gusto'),
            _buildIngrediente('Aceite de oliva extra virgen'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildIngrediente(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFFC0FF00),
            size: 20,
          ),
          const SizedBox(width: 15),
          Text(texto, style: const TextStyle(color: Colors.grey, fontSize: 17)),
        ],
      ),
    );
  }
}
