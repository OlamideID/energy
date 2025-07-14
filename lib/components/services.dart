import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Solar Energy Solutions', 'image': 'assets/solar.jpg'},
      {'title': 'Gas & Biofuels', 'image': 'assets/biofuel.jpg'},
      {'title': 'Sustainable Transport', 'image': 'assets/car.jpg'},
      {'title': 'Wind Farms', 'image': 'assets/wind.jpg'},
      {'title': 'Geothermal Power Plants', 'image': 'assets/power.jpg'},
      {'title': 'Waste to Energy', 'image': 'assets/waste.jpg'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'OUR SERVICES',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 80,
            height: 3,
            color: Colors.green,
            margin: const EdgeInsets.only(top: 8, bottom: 32),
          ),

          // Responsive layout using Wrap (lightweight)
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth >= 1200) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth >= 600) {
                crossAxisCount = 2;
              }

              final itemWidth =
                  (constraints.maxWidth - ((crossAxisCount - 1) * 20)) /
                  crossAxisCount;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children:
                    services.map((service) {
                      return SizedBox(
                        width: itemWidth,
                        child: _buildCard(
                          context,
                          service['title']!,
                          service['image']!,
                        ),
                      );
                    }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 160,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
            ),
          ),
          // Title + Link
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _navigateToDetail(context, title),
                  child: const Text(
                    'Learn more',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String title) {
    final routes = {
      'Solar Energy Solutions': '/solar',
      'Gas & Biofuels': '/gas-biofuels',
      'Sustainable Transport': '/sustainable-transport',
      'Wind Farms': '/wind-farms',
      'Geothermal Power Plants': '/geothermal',
      'Waste to Energy': '/waste-to-energy',
    };
    final route = routes[title] ?? '/solar';
    context.push(route);
  }
}
