import 'package:flutter/material.dart';

class BioFuel extends StatelessWidget {
  const BioFuel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Full width image
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fuel.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Leading Africa's Energy Transition with Gas and Biofuels",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Centered title
            const Text(
              'GAS & BIOFUELS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 8),

            // Centered divider
            Container(width: 120, height: 2, color: Colors.green),

            const SizedBox(height: 32),

            // Content with horizontal padding only
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Though natural gas stands out as a transition fuel because of its economic viability compared to emerging renewable technologies and less polluting effects compared to other fossil fuels, making the use of gas for powering mobility a popular transition subject globally. ',
                        ),
                        TextSpan(
                          text:
                              'Moreso, the production of cleaner gases like green or blue hydrogen for clean mobility (hydrogen-powered vehicles) to achieve zero emissions assurance towards the retardation of global warming.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Transportation being a key contributor to GHG emissions (23 - 30%), stimulating adoption and proliferation of hydrogen powered vehicles would make a landslide contribution in building a climate friendly world.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Clean gases and biofuels will complement the deployment of fossil based gases into the future, and these are new opportunities for both social and economic growth in Africa. There are various natural resources that have been explored as potential biofuel options within Africa, and some have met various levels of success, while others have met environmental or economic brick walls. Our plan is to plant energy crops (like cacti) to produce biofuels, thus ensuring no competition with human consumption of other suitable crops like corn, cassava, and sugar cane.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: const Center(
        child: Text(
          '© Copyright Novis Energy. All Rights Reserved',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class EVLandingScreen extends StatelessWidget {
  const EVLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            // Sustainable Transport Section
            _buildSustainableTransportSection(),
            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/car.jpg'), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black.withOpacity(0.3), Colors.transparent],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Powering Mobility, Empowering Africa',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSustainableTransportSection() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              // Title
              const Text(
                'SUSTAINABLE TRANSPORT',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00C851), // Green color
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Divider line
              Container(width: 60, height: 3, color: const Color(0xFF00C851)),
              const SizedBox(height: 40),

              // First paragraph
              const Text(
                'The electrification of transportation is the new frontier for mobility. To this end, Oando Clean Energy is championing the cause for EV adoption; ensuring the availability of affordable and easy to maintain EVs to Africans at large, whilst also ensuring accessibility of excellent charging infrastructure and after sales services.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Second paragraph
              const Text(
                'Addressing the challenges of greenhouse effects and global warming by eliminating tail pipe emissions and reducing the harmful air pollutants that are ravaging our world requires a collective effort in transitioning our transport systems from combustion engines to EV or clean gas.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: const Center(
        child: Text(
          '© Copyright Novis Energy. All Rights Reserved',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class WindVane extends StatelessWidget {
  const WindVane({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            // Sustainable Transport Section
            _buildSustainableTransportSection(),
            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wind.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black.withOpacity(0.4), Colors.transparent],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Africa is awake to local solutions to our local challenges',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSustainableTransportSection() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              // Title
              const Text(
                'WIND FARMS',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00C851), // Green color
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Divider line
              Container(width: 60, height: 3, color: const Color(0xFF00C851)),
              const SizedBox(height: 40),

              // First paragraph
              const Text(
                'While global wind-based electricity generation is still underdeveloped relative to exploitation of other renewable fuels such as hydro, it has grown at an average annual rate of about 30 percent between 1996 and 2008, making wind one of the world\'s fastest-growing energy resource in terms of both coverage and technological innovations.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Second paragraph
              const Text(
                'Wind resource mapping potential is important in establishing the upper limits of wind energy development. A study to assess the potential for wind power found that Africa "possesses an astonishing technical wind capability of almost 180,000 terawatt hours (TWh) per year- enough to satisfy the entire continent\'s electricity demands 250 times over."',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Third paragraph
              const Text(
                'In Africa, results demonstrated that the best wind is found in the coastal regions of the continent; in the North (Algeria, Egypt, Morocco Tunisia, and Mauritania), the East (Djibouti, Eritrea, Seychelles, and Somalia), West (Cape Verde) and South (South Africa and Lesotho). However, for Nigeria, Northern Nigeria looks promising.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: const Center(
        child: Text(
          '© Copyright Novis Energy. All Rights Reserved',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class GeothermalLandingScreen extends StatelessWidget {
  const GeothermalLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            // Sustainable Transport Section
            _buildSustainableTransportSection(),
            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/power.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black.withOpacity(0.4), Colors.transparent],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Powering Africa with underground "warmth" to reduce atmospheric heat',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSustainableTransportSection() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              // Title
              const Text(
                'GEOTHERMAL POWER PLANTS',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00C851), // Green color
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Divider line
              Container(width: 60, height: 3, color: const Color(0xFF00C851)),
              const SizedBox(height: 40),

              // First paragraph
              const Text(
                'With the abundance of geothermal resources, powering Africa from the heat beneath our feet is an innovative approach to generate clean and efficient, and efficient baseload electricity to support businesses, homes, and governmental institutions. It is a more reliable renewable source of energy than solar and wind, as it does not depend on weather conditions.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Second paragraph
              const Text(
                'Currently, Kenya is the largest geothermal energy producer in Africa with 40% of its electricity generated from geothermal power plants. Our plan is to develop Africa\'s geothermal energy potential over the next decade.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Third paragraph
              const Text(
                'Starting with the development of a geothermal power plant to power Oil and Gas operations in the Niger Delta, Oando Clean Energy will invest in a series of geothermal power stations across the continent.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // CTA Button
              // ElevatedButton(
              //   onPressed: () {
              //     // Handle button press
              //     print('Read Pre-Feasibility Assessment pressed');
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.transparent,
              //     foregroundColor: const Color(0xFF00C851),
              //     elevation: 0,
              //     side: const BorderSide(
              //       color: Color(0xFF00C851),
              //       width: 2,
              //     ),
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 32,
              //       vertical: 16,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //   ),
              //   child: const Text(
              //     'Read our Pre-Feasibility Assessment',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

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
}
