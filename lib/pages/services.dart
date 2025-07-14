import 'dart:js' as js;

import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  void _sendConsultationEmail() {
    const String email = 'info@novisenergy.ng';
    const String subject = 'Consultation Request - Novis Energy Services';
    const String body = '''Hello Novis Energy Team,

I am interested in learning more about your renewable energy solutions and would like to schedule a consultation.

Please contact me to discuss:
- Service requirements
- Project scope
- Timeline and budget

Thank you for your time.

Best regards,
[Your Name]
[Your Contact Information]''';

    final String mailtoUrl =
        'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

    try {
      js.context.callMethod('open', [mailtoUrl]);
    } catch (e) {
      debugPrint('Error opening email client: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Hero Section
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [Image.asset('assets/novis2.png')],
              ),
            ),
          ),

          // Services Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 60),
                _buildSectionHeader('OUR COMPREHENSIVE SOLUTIONS'),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'We provide cutting-edge renewable energy solutions and sustainable transport technologies to drive Africa\'s clean energy transformation.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // Smart Mobility - Solar Powered Transport Solutions
          _buildServiceSection(
            context,
            title: 'SMART MOBILITY - SOLAR POWERED TRANSPORT SOLUTIONS',
            subtitle: 'Electric Tricycles',
            imagePath: 'assets/keke.jpg',
            content: [
              'Revolutionary solar-powered electric tricycles designed for African urban and rural transportation needs. Our smart mobility solutions combine solar energy harvesting with efficient electric propulsion systems.',
              'These eco-friendly vehicles provide affordable, sustainable transportation while reducing carbon emissions and operating costs. Perfect for last-mile delivery, passenger transport, and commercial applications.',
              'Each tricycle features integrated solar panels, smart battery management systems, and GPS tracking capabilities for optimal performance and fleet management.',
            ],
          ),

          // Electric Vehicles (EV)
          _buildServiceSection(
            context,
            title: 'ELECTRIC VEHICLES (EV)',
            subtitle: 'Next-Generation Mobility',
            imagePath: 'assets/car2.jpg',
            content: [
              'Comprehensive electric vehicle solutions tailored for the African market. We offer a complete range of EVs from passenger cars to commercial vehicles, designed for durability and efficiency.',
              'Our EVs feature advanced battery technology, regenerative braking systems, and smart connectivity features. Built to withstand African road conditions while delivering superior performance.',
              'We provide complete lifecycle support including vehicle customization, maintenance services, and battery management to ensure optimal vehicle performance and longevity.',
            ],
            reverseLayout: true,
          ),

          // Electric Vehicle Charging Infrastructure
          _buildServiceSection(
            context,
            title: 'ELECTRIC VEHICLE CHARGING INFRASTRUCTURE',
            subtitle: 'Powering the EV Revolution',
            imagePath: 'assets/charge.jpg',
            content: [
              'Building Africa\'s most comprehensive EV charging network with strategically located charging stations across urban and highway corridors. Our infrastructure supports all EV types and charging standards.',
              'Features include fast DC charging, smart grid integration, mobile app connectivity, and solar-powered charging options. Each station is designed for reliability and user convenience.',
              'We offer turnkey charging solutions for businesses, municipalities, and residential complexes, complete with installation, maintenance, and 24/7 technical support.',
            ],
          ),

          // Renewable Energy System and Infrastructure
          _buildServiceSection(
            context,
            title: 'RENEWABLE ENERGY SYSTEM & INFRASTRUCTURE',
            subtitle: 'Sustainable Power Solutions',
            imagePath: 'assets/renewable.png',
            content: [
              'End-to-end renewable energy infrastructure development including solar farms, wind installations, and hybrid power systems. We design, build, and maintain large-scale renewable energy projects.',
              'Our solutions include grid-tied systems, off-grid installations, and microgrid development for communities and industrial applications. All systems feature smart monitoring and automated controls.',
              'We provide comprehensive project management from feasibility studies and environmental assessments to construction, commissioning, and long-term operation and maintenance.',
            ],
            reverseLayout: true,
          ),

          // Research and Development
          _buildServiceSection(
            context,
            title: 'RESEARCH & DEVELOPMENT',
            subtitle: 'Innovation in Renewable Energy Technologies',
            imagePath: 'assets/inverter.jpg',
            content: [
              'Cutting-edge R&D in solar panels, battery storage systems, and power inverters specifically designed for African climate conditions and energy requirements.',
              'Our research focuses on improving efficiency, durability, and cost-effectiveness of renewable energy components. We collaborate with leading universities and research institutions.',
              'Key areas include advanced photovoltaic materials, next-generation battery chemistry, smart inverter technology, and energy management systems optimized for tropical environments.',
            ],
          ),

          // Consultancy and Technical Services
          _buildServiceSection(
            context,
            title: 'CONSULTANCY & TECHNICAL SERVICES',
            subtitle: 'Expert Guidance for Your Energy Journey',
            imagePath: 'assets/consultations.png',
            content: [
              'Professional consulting services covering renewable energy project development, feasibility studies, regulatory compliance, and technical due diligence for investors and developers.',
              'Our expert team provides energy audits, system design optimization, performance monitoring, and troubleshooting services to maximize your renewable energy investments.',
              'We offer training programs, capacity building workshops, and technical support to help organizations and communities successfully adopt and maintain renewable energy systems.',
            ],
            reverseLayout: true,
          ),

          // Call to Action
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Ready to Transform Your Energy Future?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Partner with us to build sustainable, efficient, and cost-effective energy solutions for your business or community.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _sendConsultationEmail();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'GET CONSULTATION',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: const Center(
                child: Text(
                  '© Copyright Novis Energy. All Rights Reserved',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 80, height: 2, color: Colors.green),
      ],
    );
  }

  SliverToBoxAdapter _buildServiceSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imagePath,
    required List<String> content,
    bool reverseLayout = false,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: isMobile ? 20 : 40,
        ),
        color: reverseLayout ? Colors.grey[50] : Colors.white,
        child:
            isMobile
                ? _buildMobileServiceContent(
                  title,
                  subtitle,
                  imagePath,
                  content,
                )
                : _buildDesktopServiceContent(
                  title,
                  subtitle,
                  imagePath,
                  content,
                  reverseLayout,
                ),
      ),
    );
  }

  Widget _buildMobileServiceContent(
    String title,
    String subtitle,
    String imagePath,
    List<String> content,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 60, height: 2, color: Colors.green),
        const SizedBox(height: 20),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...content.map(
          (paragraph) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              paragraph,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopServiceContent(
    String title,
    String subtitle,
    String imagePath,
    List<String> content,
    bool reverseLayout,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!reverseLayout) ...[
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(width: 80, height: 3, color: Colors.green),
              const SizedBox(height: 24),
              ...content.map(
                (paragraph) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    paragraph,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.8,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (reverseLayout) ...[
          const SizedBox(width: 40),
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
