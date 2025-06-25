import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 600;
            bool isMediumScreen = constraints.maxWidth < 1200;

            if (isSmallScreen) {
              return _buildSingleColumnLayout(context);
            } else if (isMediumScreen) {
              return _buildTwoColumnLayout(context);
            } else {
              return _buildThreeColumnLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildSingleColumnLayout(BuildContext context) {
    return Column(children: _buildAllServiceCards(context));
  }

  Widget _buildTwoColumnLayout(BuildContext context) {
    return Column(
      children: [
        _buildRow(_buildServiceCards(context).sublist(0, 2)),
        const SizedBox(height: 40),
        _buildRow(_buildServiceCards(context).sublist(2, 4)),
        const SizedBox(height: 40),
        _buildRow(_buildServiceCards(context).sublist(4, 6)),
      ],
    );
  }

  Widget _buildThreeColumnLayout(BuildContext context) {
    return Column(
      children: [
        _buildRow(_buildServiceCards(context).sublist(0, 3)),
        const SizedBox(height: 40),
        _buildRow(_buildServiceCards(context).sublist(3, 6)),
      ],
    );
  }

  List<Widget> _buildAllServiceCards(BuildContext context) {
    return _buildServiceCards(context)
        .map(
          (card) =>
              Padding(padding: const EdgeInsets.only(bottom: 20), child: card),
        )
        .toList();
  }

  List<Widget> _buildServiceCards(BuildContext context) {
    return [
      _buildServiceCard(context, 'Solar Energy Solutions', 'assets/solar.jpg'),
      _buildServiceCard(context, 'Gas & Biofuels', 'assets/biofuel.jpg'),
      _buildServiceCard(context, 'Sustainable Transport', 'assets/car.jpg'),
      _buildServiceCard(context, 'Wind Farms', 'assets/wind.jpg'),
      _buildServiceCard(context, 'Geothermal Power Plants', 'assets/power.jpg'),
      _buildServiceCard(context, 'Waste to Energy', 'assets/waste.jpg'),
    ];
  }

  Widget _buildRow(List<Widget> children) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            children
                .map(
                  (widget) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: widget,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String imagePath,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.grey.shade400,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _navigateToDetailPage(context, title),
              child: const Text(
                'Learn more',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, String title) {
    final Map<String, String> routeMap = {
      'Solar Energy Solutions': '/solar',
      'Gas & Biofuels': '/gas-biofuels',
      'Sustainable Transport': '/sustainable-transport',
      'Wind Farms': '/wind-farms',
      'Geothermal Power Plants': '/geothermal',
      'Waste to Energy': '/waste-to-energy',
    };

    final route = routeMap[title];

    if (route != null) {
      context.go(route); // OR context.push(route); if you want stack-based nav
    } else {
      // fallback route
      context.go('/solar');
    }
  }
}
