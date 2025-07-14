import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileDrawer extends StatefulWidget {
  final String? activeItem;

  const MobileDrawer({super.key, this.activeItem});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  String? _currentActiveItem;

  @override
  void initState() {
    super.initState();
    _currentActiveItem = widget.activeItem;
  }

  String _determineActiveItem() {
    // Get the current route
    final currentRoute = GoRouterState.of(context).uri.toString();

    if (currentRoute.startsWith('/services')) {
      return 'SERVICES';
    } else if (currentRoute.contains('target=about')) {
      return 'ABOUT US';
    } else if (currentRoute.contains('target=contact')) {
      return 'CONTACT';
    } else if (currentRoute == '/' || currentRoute.contains('target=home')) {
      return 'HOME';
    }

    return _currentActiveItem ?? 'HOME';
  }

  void handleTap(String item) {
    setState(() {
      _currentActiveItem = item;
    });

    Navigator.pop(context);

    final scrollTargets = ['HOME', 'ABOUT US', 'CONTACT'];
    if (scrollTargets.contains(item)) {
      final target =
          item == 'HOME'
              ? 'home'
              : item == 'ABOUT US'
              ? 'about'
              : 'contact';
      context.go('/?target=$target');
    } else if (item == 'SERVICES') {
      context.go('/services');
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeItem = _determineActiveItem();

    return Drawer(
      backgroundColor: Colors.white,
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.green.shade50, Colors.white],
            stops: const [0.0, 0.3, 1.0],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: InkWell(
                  onTap: () => context.go('/'),
                  child: Image.asset(
                    'assets/novis2.png',
                    height: 70,
                    fit: BoxFit.contain,
                    opacity: const AlwaysStoppedAnimation(0.8),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerMenuItem(
                      title: 'HOME',
                      icon: Icons.home_outlined,
                      isActive: activeItem == 'HOME',
                      onTap: () => handleTap('HOME'),
                    ),
                    DrawerMenuItem(
                      title: 'ABOUT US',
                      icon: Icons.info_outline,
                      isActive: activeItem == 'ABOUT US',
                      onTap: () => handleTap('ABOUT US'),
                    ),
                    DrawerMenuItem(
                      title: 'OUR SERVICES',
                      icon: Icons.construction_outlined,
                      isActive: activeItem == 'SERVICES',
                      onTap: () => handleTap('SERVICES'),
                    ),
                    DrawerMenuItem(
                      title: 'CONTACT',
                      icon: Icons.contact_mail_outlined,
                      isActive: activeItem == 'CONTACT',
                      onTap: () => handleTap('CONTACT'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green.shade50, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.green.shade100, width: 1),
                ),
                child: Text(
                  '© 2025 Novis Energy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const DrawerMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border:
            isActive
                ? Border(
                  left: BorderSide(color: Colors.green.shade700, width: 5),
                )
                : null,
        boxShadow:
            isActive
                ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
                : [],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isActive ? Colors.green.shade300 : Colors.green.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.green.shade800, size: 20),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.green.shade800 : Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
