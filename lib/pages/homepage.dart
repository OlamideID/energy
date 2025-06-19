import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  final GlobalKey contactKey = GlobalKey();

  final List<String> imageUrls = [
    'https://picsum.photos/800/400?random=1',
    'https://picsum.photos/800/400?random=2',
    'https://picsum.photos/800/400?random=3',
    'https://picsum.photos/800/400?random=4',
    'https://picsum.photos/800/400?random=5',
  ];

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + imageUrls.length) % imageUrls.length;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
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
    switch (item) {
      case 'HOME':
        scrollToSection(homeKey);
        break;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialScrollTarget != null) {
        scrollToItem(widget.initialScrollTarget!);
      }
    });
  }

  Widget buildSection(String title, Color color, {Key? key}) {
    return Container(
      key: key,
      height: 400,
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 32, color: Colors.white),
      ),
    );
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
                  child: CachedNetworkImage(
                    imageUrl: imageUrls[currentIndex],
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                Positioned(
                  left: 20,
                  child: IconButton(
                    onPressed: goToPrevious,
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 30),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: IconButton(
                    onPressed: goToNext,
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 30),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imageUrls.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 30 : 15,
                        height: 6,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.green
                              : Colors.white70,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildSection("About Us Section", Colors.green.shade700, key: aboutKey),
          buildSection("Contact Section", Colors.red.shade700, key: contactKey),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
