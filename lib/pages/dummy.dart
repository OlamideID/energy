import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  final String title;

  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/biofuel.jpg', height: 200),
            const SizedBox(height: 30),
            const Text(
              'Gas & Biofuels',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Our sustainable gas solutions and biofuel conversion services help reduce carbon emissions while maintaining energy efficiency.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Learn About Biofuels'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Conversion Options'),
                ),
              ],
            ),
          ],
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

class InterviewsPage extends StatelessWidget {
  const InterviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mic_external_on, size: 80, color: Colors.indigo),
            const SizedBox(height: 30),
            const Text(
              'Exclusive Interviews',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'In-depth conversations with industry leaders and innovators shaping the future of renewable energy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildInterviewCard('Dr. Sarah Chen', 'Solar Tech Innovations'),
                _buildInterviewCard('Mark Williams', 'Biofuel Breakthroughs'),
                _buildInterviewCard('Emma Rodriguez', 'Wind Farm Expansion'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterviewCard(String name, String topic) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              radius: 40,
              child: const Icon(Icons.person, size: 40, color: Colors.indigo),
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              topic,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.indigo,
                side: const BorderSide(color: Colors.indigo),
              ),
              child: const Text('Watch Interview'),
            ),
          ],
        ),
      ),
    );
  }
}

class MediaReleasesPage extends StatelessWidget {
  const MediaReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.newspaper, size: 80, color: Colors.blue),
            const SizedBox(height: 30),
            const Text(
              'Media Releases',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Official announcements, press releases, and company updates from our energy solutions network.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildReleaseItem(
                    'New Solar Farm Partnership',
                    'June 15, 2023',
                    Icons.solar_power,
                  ),
                  _buildReleaseItem(
                    'Biofuel Certification Achieved',
                    'May 28, 2023',
                    Icons.local_gas_station,
                  ),
                  _buildReleaseItem(
                    'Annual Sustainability Report',
                    'April 10, 2023',
                    Icons.assessment,
                  ),
                  _buildReleaseItem(
                    'EV Charging Network Expansion',
                    'March 22, 2023',
                    Icons.electric_car,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReleaseItem(String title, String date, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}


