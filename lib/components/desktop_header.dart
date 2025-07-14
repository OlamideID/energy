import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopHeader extends StatefulWidget {
  final List<String> navItems = ['HOME', 'ABOUT US', 'OUR SERVICES', 'CONTACT'];
  final Function(String)? onItemTap;

  DesktopHeader({super.key, this.onItemTap});

  @override
  State<DesktopHeader> createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<DesktopHeader> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  String _determineActiveItem() {
    // Get the current route
    final currentRoute = GoRouterState.of(context).uri.toString();

    if (currentRoute.startsWith('/services')) {
      return 'OUR SERVICES';
    } else if (currentRoute.contains('target=about')) {
      return 'ABOUT US';
    } else if (currentRoute.contains('target=contact')) {
      return 'CONTACT';
    } else if (currentRoute == '/' || currentRoute.contains('target=home')) {
      return 'HOME';
    }

    return 'HOME';
  }

  void onNavItemTap(BuildContext context, String item) {
    setState(() {});

    String? target;

    switch (item) {
      case 'HOME':
        target = 'home';
        break;
      case 'ABOUT US':
        target = 'about';
        break;
      case 'OUR SERVICES':
        context.go('/services');
        return;
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
    final activeItem = _determineActiveItem();

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
            InkWell(
              onTap: () => onNavItemTap(context, 'HOME'),
              child: Image.asset(
                'assets/novis2.png',
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Novis Energy',
              style: TextStyle(
                color: Colors.green[900],
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            Row(
              children:
                  widget.navItems.map((item) {
                    final isActive = activeItem == item;
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: InkWell(
                        onTap: () => onNavItemTap(context, item),
                        borderRadius: BorderRadius.circular(25),
                        hoverColor: Colors.green.shade50,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              colors:
                                  isActive
                                      ? [
                                        Colors.green.shade100,
                                        Colors.green.shade200,
                                      ]
                                      : [Colors.white, Colors.green.shade50],
                            ),
                            border: Border.all(
                              color:
                                  isActive
                                      ? Colors.green.shade400
                                      : Colors.green.shade200,
                              width: isActive ? 2 : 1,
                            ),
                            boxShadow:
                                isActive
                                    ? [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                    : [],
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  isActive ? FontWeight.w700 : FontWeight.w600,
                              color:
                                  isActive
                                      ? Colors.green.shade800
                                      : Colors.green.shade700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
