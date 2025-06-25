import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileDrawer extends StatefulWidget {
  final List<String> serviceItems;
  final List<String> mediaItems;
  final String? activeItem;

  const MobileDrawer({
    super.key,
    required this.serviceItems,
    required this.mediaItems,
    this.activeItem,
  });

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  bool isServiceActive() => widget.serviceItems.contains(widget.activeItem);
  bool isMediaActive() => widget.mediaItems.contains(widget.activeItem);

  final Map<String, String> _routeMap = {
    'HOME': '/',
    'ABOUT US': '/about',
    'CONTACT': '/contact',
    'Solar Energy Solutions': '/solar',
    'Gas & Biofuels': '/gas-biofuels',
    'Sustainable Transport': '/sustainable-transport',
    'Wind Farms': '/wind-farms',
    'Geothermal Power Plants': '/geothermal',
    'Waste to Energy': '/waste-to-energy',
    'Exclusive Interviews': '/interviews',
    'Media Releases': '/media-releases',
  };

  void handleTap(String item) {
    Navigator.pop(context); // Close drawer

    // Scroll targets
    final scrollTargets = ['HOME', 'ABOUT US', 'CONTACT'];
    if (scrollTargets.contains(item)) {
      final target =
          item == 'HOME'
              ? 'home'
              : item == 'ABOUT US'
              ? 'about'
              : 'contact';
      context.go('/?target=$target');
      return;
    }

    // Static routes
    final route = _routeMap[item];
    if (route != null) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: Image.asset(
                    'assets/novis.png',
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
                      isActive: widget.activeItem == 'HOME',
                      onTap: () => handleTap('HOME'),
                    ),
                    DrawerMenuItem(
                      title: 'ABOUT US',
                      icon: Icons.info_outline,
                      isActive: widget.activeItem == 'ABOUT US',
                      onTap: () => handleTap('ABOUT US'),
                    ),

                    // Services Expansion Tile
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            isServiceActive()
                                ? Colors.green.shade50
                                : Colors.transparent,
                        border: Border.all(
                          color:
                              isServiceActive()
                                  ? Colors.green.shade200
                                  : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: isServiceActive(),
                        leading: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.engineering_outlined,
                            color: Colors.green.shade700,
                            size: 20,
                          ),
                        ),
                        iconColor: Colors.green.shade600,
                        collapsedIconColor: Colors.grey.shade600,
                        title: Text(
                          'OUR SERVICES',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color:
                                isServiceActive()
                                    ? Colors.green.shade700
                                    : Colors.black87,
                            letterSpacing: 0.5,
                          ),
                        ),
                        children:
                            widget.serviceItems.map((service) {
                              return DrawerSubItem(
                                title: service,
                                isActive: widget.activeItem == service,
                                onTap: () => handleTap(service),
                              );
                            }).toList(),
                      ),
                    ),

                    // Media Expansion Tile
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            isMediaActive()
                                ? Colors.green.shade50
                                : Colors.transparent,
                        border: Border.all(
                          color:
                              isMediaActive()
                                  ? Colors.green.shade200
                                  : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: isMediaActive(),
                        leading: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.article_outlined,
                            color: Colors.green.shade700,
                            size: 20,
                          ),
                        ),
                        iconColor: Colors.green.shade600,
                        collapsedIconColor: Colors.grey.shade600,
                        title: Text(
                          'MEDIA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color:
                                isMediaActive()
                                    ? Colors.green.shade700
                                    : Colors.black87,
                            letterSpacing: 0.5,
                          ),
                        ),
                        children:
                            widget.mediaItems.map((media) {
                              return DrawerSubItem(
                                title: media,
                                isActive: widget.activeItem == media,
                                onTap: () => handleTap(media),
                              );
                            }).toList(),
                      ),
                    ),

                    DrawerMenuItem(
                      title: 'CONTACT',
                      icon: Icons.contact_mail_outlined,
                      isActive: widget.activeItem == 'CONTACT',
                      onTap: () => handleTap('CONTACT'),
                    ),
                  ],
                ),
              ),

              // Footer Section
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSocialButton(Icons.facebook, 'Facebook'),
                        _buildSocialButton(Icons.language, 'Website'),
                        _buildSocialButton(Icons.email, 'Email'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '© 2025 Novis Energy',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade600, Colors.green.shade700],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {}, // Add your social media links here
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient:
            isActive
                ? LinearGradient(
                  colors: [Colors.green.shade100, Colors.green.shade50],
                )
                : null,
        border:
            isActive
                ? Border.all(color: Colors.green.shade300, width: 1)
                : null,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isActive ? Colors.green.shade200 : Colors.green.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.green.shade700, size: 20),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isActive ? Colors.green.shade700 : Colors.black87,
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

class DrawerSubItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const DrawerSubItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 12, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive ? Colors.green.shade100 : Colors.transparent,
        border:
            isActive
                ? Border.all(color: Colors.green.shade200, width: 1)
                : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        title: Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: isActive ? Colors.green.shade600 : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      isActive ? Colors.green.shade700 : Colors.grey.shade700,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
