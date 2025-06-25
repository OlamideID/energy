import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    String? target;

    switch (item) {
      case 'HOME':
        target = 'home';
        break;
      case 'ABOUT US':
        target = 'about';
        break;
      case 'CONTACT':
        target = 'contact';
        break;
    }

    if (target != null) {
      context.go('/?target=$target');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.white, Colors.green.shade50, Colors.white],
          stops: const [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.green.shade100, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          children: [
            Image.asset('assets/novis.png', height: 70, fit: BoxFit.contain),
            const Spacer(),
            Row(
              children:
                  navItems.map((item) {
                    final bool hasDropdown =
                        item == 'OUR SERVICES' || item == 'MEDIA';

                    if (hasDropdown) {
                      final List<String> dropdownItems =
                          item == 'OUR SERVICES' ? serviceItems : mediaItems;

                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: PopupMenuButton<String>(
                          tooltip: '',
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.green.shade100,
                              width: 1,
                            ),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.green.shade50],
                              ),
                              border: Border.all(
                                color: Colors.green.shade200,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 18,
                                  color: Colors.green.shade600,
                                ),
                              ],
                            ),
                          ),
                          itemBuilder:
                              (context) =>
                                  dropdownItems
                                      .map(
                                        (value) => PopupMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 4,
                                            ),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: Colors.green.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                          onSelected: (value) {
                            switch (value) {
                              case 'Solar Energy Solutions':
                                context.go('/solar');
                                break;
                              case 'Gas & Biofuels':
                                context.go('/gas-biofuels');
                                break;
                              case 'Sustainable Transport':
                                context.go('/sustainable-transport');
                                break;
                              case 'Wind Farms':
                                context.go('/wind-farms');
                                break;
                              case 'Geothermal Power Plants':
                                context.go('/geothermal');
                                break;
                              case 'Waste to Energy':
                                context.go('/waste-to-energy');
                                break;
                              case 'Exclusive Interviews':
                                context.go('/interviews');
                                break;
                              case 'Media Releases':
                                context.go('/media-releases');
                                break;
                            }
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: InkWell(
                          onTap: () => onNavItemTap(context, item),
                          borderRadius: BorderRadius.circular(25),
                          hoverColor: Colors.green.shade50,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.green.shade50],
                              ),
                              border: Border.all(
                                color: Colors.green.shade200,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade700,
                                letterSpacing: 0.5,
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
