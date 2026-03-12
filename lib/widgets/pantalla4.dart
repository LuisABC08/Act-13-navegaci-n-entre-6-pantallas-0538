import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; // Importante para el MenuLateral

class PantallaPlanes extends StatelessWidget {
  const PantallaPlanes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      // Agregamos el menú hamburguesa
      drawer: const MenuLateral(),
      appBar: AppBar(
        // Flutter pondrá automáticamente las 3 barras al detectar el 'drawer'
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Planes', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/comida'),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera de sección
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mis Planes Activos', 
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Ver All', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
            
            // Tarjeta de Plan Activo
            _buildActivePlanCard(),
            
            const SizedBox(height: 30),
            
            const Text(
              'Otros Planes', 
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 15),
            
            // Grid de planes secundarios
            Row(
              children: [
                Expanded(
                  child: _buildOtherPlanCard(
                    'Aumento de Masa', 
                    'Alto en Proteínas', 
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=300'
                  )
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildOtherPlanCard(
                    'Plan Keto', 
                    'Dieta Cetogénica', 
                    'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=300'
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivePlanCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Ajustado al color de cardBg
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pérdida de Peso', 
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)
                    ),
                    Text(
                      'Bajo en Calorías', 
                      style: TextStyle(color: Colors.grey, fontSize: 16)
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('2 semanas', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('1500 cal/dia', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=300', 
                      width: 100, 
                      height: 100, 
                      fit: BoxFit.cover
                    ),
                  ),
                  Positioned(
                    top: 0, 
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC0FF00), 
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text(
                        'Activo', 
                        style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC0FF00), 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Ver Plan', 
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _iconAction(Icons.check_circle, 'C oom'),
              const SizedBox(width: 10),
              _iconAction(Icons.bar_chart, null),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconAction(IconData icon, String? text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A), 
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: text != null ? const Color(0xFFC0FF00) : Colors.white),
          if (text != null) ...[
            const SizedBox(width: 5),
            Text(text, style: const TextStyle(fontSize: 12, color: Colors.white)),
          ]
        ],
      ),
    );
  }

  Widget _buildOtherPlanCard(String title, String subtitle, String img) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), 
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(img, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            title, 
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)
          ),
          Text(
            subtitle, 
            style: const TextStyle(color: Colors.grey, fontSize: 11)
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC0FF00),
              minimumSize: const Size(double.infinity, 36),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: const Text(
              'Ver Plan', 
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
    );
  }
}