import 'package:flutter/material.dart';

class SolarEnergyPage extends StatelessWidget {
  const SolarEnergyPage({super.key});

  Widget _buildFooter() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: const Center(
        child: Text(
          '© Copyright Novis  Energy. All Rights Reserved',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Main scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/solar.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SOLAR: Powering Africa with the World\'s Most Common Resource',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width > 768
                                          ? 60
                                          : 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Content Section
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 80,
                      horizontal: 20,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Text(
                          'SOLAR ENERGY SOLUTIONS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 40),
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
                  ),
                ],
              ),
            ),
          ),

          _buildFooter(),
        ],
      ),
    );
  }
}
