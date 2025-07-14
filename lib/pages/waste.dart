import 'package:flutter/material.dart';

class WasteToEnergyScreen extends StatefulWidget {
  const WasteToEnergyScreen({super.key});

  @override
  _WasteToEnergyScreenState createState() => _WasteToEnergyScreenState();
}

class _WasteToEnergyScreenState extends State<WasteToEnergyScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            SizedBox(height: 40),
            _buildProcessFlowSection(),
            SizedBox(height: 40),
            _buildAdditionalContentSection(),
            SizedBox(height: 40),
            _buildNigeriaOpportunitySection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          // Background waste image
          Positioned.fill(
            child: Image.asset(
              'assets/waste.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Title overlay
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Converting Africa's Waste Challenge",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "to Africa's Energy Feedstock",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessFlowSection() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "WASTE TO ENERGY",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
                letterSpacing: 1.5,
              ),
            ),
            Container(
              height: 3,
              width: 50,
              color: Colors.green[700],
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            SizedBox(height: 20),

            // Description text
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Novis Energy is set to lead the net zero emissions charge by decreasing the amount of methane generated from illegal dumpsites and landfills - methane has approximately 30 times higher impact on the environment compared to carbon dioxide.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Implementation of waste to energy systems for us is a high priority and the target is to produce energy and alternative fuel from waste through biochemical processes such as anaerobic digestion, fermentation, and thermochemical processes, such as pyrolysis and gasification.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Process flow diagram image
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/recycle.png', fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalContentSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "As at 2018, there were over 2,000 waste to energy plants converting municipal solid waste to energy and heat globally, with only two situated in Africa and none currently working in Nigeria.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "As a research focused organization, we will utilize feasibility studies, innovation, technology, and partnerships, to determine the best waste to energy system and technology capable of handling our specific waste types to generate immense amounts of energy towards unlocking Africa's growth potentials.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNigeriaOpportunitySection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "NIGERIA WASTE TO ENERGY OPPORTUNITY",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
              letterSpacing: 1.2,
            ),
          ),
          Container(
            height: 3,
            width: 80,
            color: Colors.green[700],
            margin: EdgeInsets.symmetric(vertical: 15),
          ),
          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/nigeria.png',
              fit: BoxFit.cover,

              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
