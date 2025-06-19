import 'package:flutter/material.dart';

class MobileHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const MobileHeader({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Text(
            "Oando Clean Energy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              scaffoldKey?.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
