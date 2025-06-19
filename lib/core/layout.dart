import 'package:energy/main.dart';
import 'package:energy/pages/homepage.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final String? initialItem; // NEW

  const MainLayout({
    super.key,
    required this.child,
    this.initialItem, // NEW
  });

  @override
  State<MainLayout> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String activeItem;

  final GlobalKey<HomepageState> homepageKey = GlobalKey<HomepageState>();

  @override
  void initState() {
    super.initState();
    activeItem = widget.initialItem ?? 'HOME'; // ✅ initialize it here
  }

  void handleNavTap(String item) {
    setState(() {
      activeItem = item;
    });

    if (widget.child is Homepage) {
      homepageKey.currentState?.scrollToItem(item);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder:
              (_) => MainLayout(
                initialItem: item,
                child: Homepage(key: homepageKey, initialScrollTarget: item),
              ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: /* your MobileDrawer code */,
      body: Column(
        children: [
          ResponsiveHeader(
            scaffoldKey: _scaffoldKey,
            onItemTap: handleNavTap,
            // activeItem: activeItem,
          ),
          Expanded(
            child:
                widget.child is Homepage
                    ? Homepage(
                      key: homepageKey,
                      initialScrollTarget: widget.initialItem,
                    )
                    : widget.child,
          ),
        ],
      ),
    );
  }
}
