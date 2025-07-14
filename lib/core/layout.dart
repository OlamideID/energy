import 'package:energy/main.dart';
import 'package:energy/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final String? activeItem;

  const MainLayout({super.key, required this.child, this.activeItem});

  @override
  State<MainLayout> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MobileDrawer(
        activeItem: widget.activeItem ?? 'HOME',
      ),
      body: Column(
        children: [
          ResponsiveHeader(scaffoldKey: _scaffoldKey),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}