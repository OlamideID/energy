import 'package:energy/widgets/value_items.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Define breakpoints
          bool isSmallScreen = constraints.maxWidth < 768; // Mobile
          bool isMediumScreen = constraints.maxWidth < 1200; // Tablet
          // Large screen (Desktop) is >= 1200

          // Adjust padding based on screen size
          double horizontalPadding =
              isSmallScreen ? 32.0 : (isMediumScreen ? 60.0 : 80.0);
          double verticalPadding =
              isSmallScreen ? 40.0 : (isMediumScreen ? 60.0 : 80.0);

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child:
                isSmallScreen
                    ? _buildMobileLayout()
                    : _buildDesktopLayout(isMediumScreen),
          );
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAboutUsSection(),
        SizedBox(height: 40),
        Container(
          width: double.infinity,
          height: 2,
          color: Colors.green,
          margin: EdgeInsets.symmetric(vertical: 20),
        ),
        SizedBox(height: 20),
        _buildCoreValuesSection(isMobile: true),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isMediumScreen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // About Us Section
        Expanded(flex: 1, child: _buildAboutUsSection()),

        // Divider
        Container(
          width: 2,
          height: isMediumScreen ? 350 : 400,
          color: Colors.green,
          margin: EdgeInsets.symmetric(horizontal: isMediumScreen ? 24 : 40),
        ),

        // Core Values Section
        Expanded(flex: 1, child: _buildCoreValuesSection()),
      ],
    );
  }

  Widget _buildAboutUsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ABOUT US',
          style: TextStyle(
            fontSize: 36,
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
          margin: EdgeInsets.only(top: 8, bottom: 32),
        ),
        Text(
          'Headquartered in Abuja, Nigeria, Novis Energy is a leading provider of solar and renewable energy solutions dedicated to powering a sustainable future across Africa.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          'We specialize in delivering clean, climate-friendly, and bankable energy systems tailored to meet the unique needs of individuals, businesses, and communities.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          'With a growing portfolio of solar installations and off-grid projects, Novis Energy is committed to bridging the energy gap through reliable, eco-friendly technologies.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          'Our mission is to accelerate the transition to clean energy by empowering homes, enterprises, and institutions with sustainable power alternatives.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          'This is more than energy — it’s about creating lasting impact for generations to come.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCoreValuesSection({bool isMobile = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'CORE VALUES',
          style: TextStyle(
            fontSize: 36,
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
          margin: EdgeInsets.only(top: 8, bottom: 32),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
            children: [
              TextSpan(text: 'A '),
              TextSpan(
                text: 'TRIBE',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' of believers, powered by our values'),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text(
          'We have a diverse team of professionals with expertise in engineering, strategy, innovation and business management. Our common thread is value creation and a commitment to a carbon neutral world.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
            children: [
              TextSpan(text: 'We call ourselves the '),
              TextSpan(
                text: 'Green TRIBE',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' as we see to promote Teamwork- in working with our various stakeholders, Respect for earth\'s resources and human life, Innovation to create a carbon neutral environment; and Beneficence to help humanity live better and to strive for Excellence in all we do.',
              ),
            ],
          ),
        ),
        SizedBox(height: 40),

        // Core Values Grid - responsive layout
        isMobile ? _buildMobileValuesGrid() : _buildDesktopValuesGrid(),
      ],
    );
  }

  Widget _buildMobileValuesGrid() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildValueItem(Icons.group, 'Teamwork'),
            _buildValueItem(Icons.favorite, 'Respect'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildValueItem(Icons.lightbulb, 'Innovation'),
            _buildValueItem(Icons.volunteer_activism, 'Beneficence'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildValueItem(Icons.star, 'Excellence')],
        ),
      ],
    );
  }

  Widget _buildDesktopValuesGrid() {
    return Center(
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        children: [
          _buildValueItem(Icons.group, 'Teamwork'),
          _buildValueItem(Icons.favorite, 'Respect'),
          _buildValueItem(Icons.lightbulb, 'Innovation'),
          _buildValueItem(Icons.volunteer_activism, 'Beneficence'),
          _buildValueItem(Icons.star, 'Excellence'),
        ],
      ),
    );
  }

  Widget _buildValueItem(IconData icon, String title) {
    return ValueItem(icon: icon, title: title);
  }
}
