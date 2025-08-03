import 'package:energy/components/desktop_header.dart';
import 'package:energy/components/mobile.dart';
import 'package:energy/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Novis Energy',
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
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
        if (constraints.maxWidth > 1000) {
          return DesktopHeader(onItemTap: onItemTap);
        } else {
          return MobileHeader(scaffoldKey: scaffoldKey);
        }
      },
    );
  }
}
