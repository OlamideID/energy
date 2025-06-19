import 'package:flutter/material.dart';

class SolarEnergySolutionsSection extends StatelessWidget {
  const SolarEnergySolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'SOLAR ENERGY SOLUTIONS',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Harnessing the power of the sun to provide sustainable, clean energy solutions across Africa. Our solar technology delivers reliable, cost-effective power for communities, businesses, and industries.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
              height: 1.6,
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
