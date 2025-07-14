import 'package:energy/core/layout.dart';
import 'package:energy/pages/dummy.dart';
import 'package:energy/pages/homepage.dart';
import 'package:energy/pages/services.dart';
import 'package:energy/pages/solar.dart';
import 'package:energy/pages/waste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final target = state.uri.queryParameters['target'];
        return MainLayout(
          activeItem: 'HOME',
          child: Homepage(
            key: GlobalKey<HomepageState>(),
            initialScrollTarget: target,
          ),
        );
      },
      routes: [
        GoRoute(
          path: 'solar',
          builder:
              (context, state) => MainLayout(
                activeItem: 'Solar Energy Solutions',
                child: const SolarEnergyPage(),
              ),
        ),
        GoRoute(
          path: 'gas-biofuels',
          builder:
              (context, state) => MainLayout(
                activeItem: 'Gas & Biofuels',
                child: const BioFuel(),
              ),
        ),
        GoRoute(
          path: 'sustainable-transport',
          builder:
              (context, state) => MainLayout(
                activeItem: 'Sustainable Transport',
                child: const EVLandingScreen(),
              ),
        ),
        GoRoute(
          path: 'wind-farms',
          builder:
              (context, state) =>
                  MainLayout(activeItem: 'Wind Farms', child: const WindVane()),
        ),
        GoRoute(
          path: 'geothermal',
          builder:
              (context, state) => MainLayout(
                activeItem: 'Geothermal Power Plants',
                child: const GeothermalLandingScreen(),
              ),
        ),
        GoRoute(
          path: 'services',
          builder: (context, state) {
            return MainLayout(activeItem: 'services', child: ServicesPage());
          },
        ),
        GoRoute(
          path: 'waste-to-energy',
          builder:
              (context, state) => MainLayout(
                activeItem: 'Waste to Energy',
                child: const WasteToEnergyScreen(),
              ),
        ),
      ],
    ),
  ],
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(child: Text('Page not found: ${state.uri.toString()}')),
      ),
);
