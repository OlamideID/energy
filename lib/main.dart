import 'package:energy/components/desktop_header.dart';
import 'package:energy/components/mobile.dart';
import 'package:energy/core/layout.dart';
import 'package:energy/pages/homepage.dart';
import 'package:energy/pages/solar.dart';
import 'package:energy/widgets/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oando Clean Energy',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      // home: MainLayout(child: Homepage()),
      home: MainLayout(child: Homepage()),
    );
  }
}

class SolarEnergyHomePage extends StatelessWidget {
  final List<String> serviceItems = [
    'Solar Energy Solutions',
    'Gas & Biofuels',
    'Sustainable Transport',
    'Wind Farms',
    'Geothermal Power Plants',
    'Waste to Energy',
  ];

  final List<String> mediaItems = ['Exclusive Interviews', 'Media Releases'];

  SolarEnergyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:
          MediaQuery.of(context).size.width <= 800
              ? MobileDrawer(serviceItems: serviceItems, mediaItems: mediaItems)
              : null,
      body: SingleChildScrollView(child: Column(children: [SolarEnergyPage()])),
    );
  }
}

class ResponsiveHeader extends StatelessWidget {
  final Function(String)? onItemTap;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const ResponsiveHeader({super.key, this.onItemTap, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return DesktopHeader(onItemTap: onItemTap);
        } else {
          return MobileHeader(scaffoldKey: scaffoldKey);
        }
      },
    );
  }
}
