import 'dart:async';

import 'package:energy/components/about.dart';
import 'package:energy/components/services.dart';
import 'package:energy/widgets/contact.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final String? initialScrollTarget;

  const Homepage({super.key, this.initialScrollTarget});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  int currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
  ];

  Timer? _carouselTimer;

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
  }

  void scrollToItem(String item) {
    switch (item.toUpperCase()) {
      case 'HOME':
        scrollToSection(homeKey);
        break;
      case 'ABOUT':
      case 'ABOUT US':
        scrollToSection(aboutKey);
        break;
      case 'CONTACT':
        scrollToSection(contactKey);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      goToNext();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialScrollTarget != null) {
        scrollToItem(widget.initialScrollTarget!);
      }
    });
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Container(
            key: homeKey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      images[currentIndex],
                      key: ValueKey(images[currentIndex]),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  child: IconButton(
                    onPressed: goToPrevious,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: IconButton(
                    onPressed: goToNext,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 30 : 15,
                        height: 6,
                        decoration: BoxDecoration(
                          color: currentIndex == index ? Colors.green : Colors.white70,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AboutUS(key: aboutKey),
          Services(key: servicesKey),
          ContactUsSection(key: contactKey),
        ],
      ),
    );
  }
}
