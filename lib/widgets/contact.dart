import 'package:flutter/material.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          // Main contact section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              children: [
                // Title
                const Text(
                  'CONTACT US',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2ECC71),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),

                // Green underline
                Container(width: 80, height: 3, color: const Color(0xFF2ECC71)),

                const SizedBox(height: 40),

                // Subtitle
                const Text(
                  'We can be reached on any of the channels below',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 60),

                // Contact information row
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      // Desktop layout - side by side
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildContactItem(
                            icon: Icons.location_on_outlined,
                            title: 'ADDRESS',
                            content: 'N0. 5 Audu Ogbe Street Jabi',
                          ),
                          _buildContactItem(
                            icon: Icons.email_outlined,
                            title: 'EMAIL',
                            content: 'novislimited1@gmail.com',
                          ),
                        ],
                      );
                    } else {
                      // Mobile layout - stacked
                      return Column(
                        children: [
                          _buildContactItem(
                            icon: Icons.location_on_outlined,
                            title: 'ADDRESS',
                            content:
                                'Wings Office Complex 17a Ozumba Mbadiwe Avenue Victoria Island Lagos',
                          ),
                          const SizedBox(height: 40),
                          _buildContactItem(
                            icon: Icons.email_outlined,
                            title: 'EMAIL',
                            content: 'info@oandocleanenergy.com',
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.black,
            child: const Text(
              '© Novis Energy. All Rights Reserved',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        children: [
          // Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: const Color(0xFF2ECC71), size: 30),
          ),

          const SizedBox(height: 20),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 12),

          // Content
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Example usage in a complete app
class ContactUsApp extends StatelessWidget {
  const ContactUsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Us Demo',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Add other sections above if needed
              const ContactUsSection(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
