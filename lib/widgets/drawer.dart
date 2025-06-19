import 'package:flutter/material.dart';

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
  bool isServicesExpanded = false;
  bool isMediaExpanded = false;

  bool isServiceActive() {
    return widget.serviceItems.contains(widget.activeItem);
  }

  bool isMediaActive() {
    return widget.mediaItems.contains(widget.activeItem);
  }

  void handleTap(String item) {
    Navigator.pop(context); // Close drawer
    // final layout = MainLayout.of(context);
    // layout?.handleNavTap(item);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.wb_sunny,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oando Clean Energy',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Powering Africa\'s Future',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Items
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
                  ExpansionTile(
                    initiallyExpanded: isServiceActive(),
                    leading: const Icon(Icons.engineering_outlined,
                        color: Colors.green),
                    title: Text(
                      'OUR SERVICES',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            isServiceActive() ? Colors.green : Colors.black87,
                      ),
                    ),
                    iconColor: Colors.green,
                    collapsedIconColor: Colors.grey[600],
                    children: widget.serviceItems.map((service) {
                      return DrawerSubItem(
                        title: service,
                        isActive: widget.activeItem == service,
                        onTap: () => handleTap(service),
                      );
                    }).toList(),
                  ),
                  ExpansionTile(
                    initiallyExpanded: isMediaActive(),
                    leading: const Icon(Icons.article_outlined,
                        color: Colors.green),
                    title: Text(
                      'MEDIA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isMediaActive() ? Colors.green : Colors.black87,
                      ),
                    ),
                    iconColor: Colors.green,
                    collapsedIconColor: Colors.grey[600],
                    children: widget.mediaItems.map((media) {
                      return DrawerSubItem(
                        title: media,
                        isActive: widget.activeItem == media,
                        onTap: () => handleTap(media),
                      );
                    }).toList(),
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

            // Footer
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.language, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© 2025 Oando Clean Energy',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
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
    return ListTile(
      leading: Icon(icon, color: Colors.green, size: 24),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.green : Colors.black87,
          decoration: isActive ? TextDecoration.underline : null,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 72, right: 20),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: isActive ? Colors.green : Colors.grey[700],
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          decoration: isActive ? TextDecoration.underline : null,
        ),
      ),
      onTap: onTap,
      dense: true,
    );
  }
}
