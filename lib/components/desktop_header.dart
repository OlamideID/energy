import 'package:energy/core/layout.dart';
import 'package:energy/pages/dummy.dart';
import 'package:energy/pages/homepage.dart';
import 'package:energy/pages/solar.dart';
import 'package:flutter/material.dart';

class DesktopHeader extends StatelessWidget {
  final List<String> navItems = [
    'HOME',
    'ABOUT US',
    'OUR SERVICES',
    'MEDIA',
    'CONTACT',
  ];

  final List<String> serviceItems = [
    'Solar Energy Solutions',
    'Gas & Biofuels',
    'Sustainable Transport',
    'Wind Farms',
    'Geothermal Power Plants',
    'Waste to Energy',
  ];

  final List<String> mediaItems = ['Exclusive Interviews', 'Media Releases'];
  final Function(String)? onItemTap;

  DesktopHeader({super.key, this.onItemTap});

  void onNavItemTap(BuildContext context, String item) {
    if (item == 'HOME' || item == 'ABOUT US' || item == 'CONTACT') {
      if (onItemTap != null) {
        onItemTap!(item); // Scroll in place
      } else {
        // Navigate to homepage with scroll target
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder:
                (_) => MainLayout(
                  child: Homepage(
                    key: GlobalKey<HomepageState>(),
                    initialScrollTarget: item,
                  ),
                ),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            // Logo
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Oando',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  ' Clean Energy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Navigation Items
            Row(
              children:
                  navItems.map((item) {
                    final bool hasDropdown =
                        item == 'OUR SERVICES' || item == 'MEDIA';

                    if (hasDropdown) {
                      final List<String> dropdownItems =
                          item == 'OUR SERVICES' ? serviceItems : mediaItems;

                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: PopupMenuButton<String>(
                          tooltip: '',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                          itemBuilder:
                              (context) =>
                                  dropdownItems
                                      .map(
                                        (value) => PopupMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList(),
                          onSelected: (value) {
                            Widget selectedPage;

                            switch (value) {
                              case 'Solar Energy Solutions':
                                selectedPage = const SolarEnergyPage();
                                break;
                              case 'Gas & Biofuels':
                              case 'Sustainable Transport':
                              case 'Wind Farms':
                              case 'Geothermal Power Plants':
                              case 'Waste to Energy':
                              case 'Exclusive Interviews':
                              case 'Media Releases':
                                selectedPage = DummyPage(title: value);
                                break;
                              default:
                                selectedPage = const DummyPage(
                                  title: 'Unknown Page',
                                );
                            }

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => MainLayout(child: selectedPage),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: InkWell(
                          onTap: () => onNavItemTap(context, item),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
