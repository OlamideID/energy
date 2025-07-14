import 'dart:async';

import 'package:energy/components/about.dart';
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
  final GlobalKey contactKey = GlobalKey();

  final List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
  ];

  Timer? _carouselTimer;
  bool _disposed = false;

  final Map<int, ImageProvider> _loadedImages = {};
  final Set<int> _loadingImages = {};
  final Set<int> _failedImages = {};

  void goToPrevious() {
    if (!_disposed && mounted) {
      setState(() {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
      });
      _preloadNearbyImages();
    }
  }

  void goToNext() {
    if (!_disposed && mounted) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
      });
      _preloadNearbyImages();
    }
  }

  void scrollToSection(GlobalKey key) {
    if (_disposed || !mounted) return;
    final context = key.currentContext;
    if (context != null) {
      try {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0.1,
        );
      } catch (e) {
        debugPrint('Scroll error: $e');
      }
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

  void _preloadNearbyImages() {
    if (_disposed) return;

    _loadImage(currentIndex, isPriority: true);
    final nextIndex = (currentIndex + 1) % images.length;
    final prevIndex = (currentIndex - 1 + images.length) % images.length;

    _loadImage(nextIndex);
    _loadImage(prevIndex);
    _cleanupDistantImages();
  }

  void _loadImage(int index, {bool isPriority = false}) {
    if (_disposed ||
        _loadedImages.containsKey(index) ||
        _loadingImages.contains(index) ||
        _failedImages.contains(index)) {
      return;
    }

    _loadingImages.add(index);
    final imageProvider = AssetImage(images[index]);

    precacheImage(imageProvider, context)
        .then((_) {
          if (!_disposed && mounted) {
            setState(() {
              _loadedImages[index] = imageProvider;
              _loadingImages.remove(index);
            });
          }
        })
        .catchError((error) {
          debugPrint('Failed to load image ${images[index]}: $error');
          if (!_disposed && mounted) {
            setState(() {
              _loadingImages.remove(index);
              _failedImages.add(index);
            });
          }
        });
  }

  void _cleanupDistantImages() {
    if (_disposed) return;

    const keepDistance = 2;
    final imagesToRemove = <int>[];

    for (final index in _loadedImages.keys) {
      final distance = _getCircularDistance(index, currentIndex, images.length);
      if (distance > keepDistance) {
        imagesToRemove.add(index);
      }
    }

    for (final index in imagesToRemove) {
      _loadedImages.remove(index);
    }
  }

  int _getCircularDistance(int index1, int index2, int length) {
    final diff = (index1 - index2).abs();
    return diff < length - diff ? diff : length - diff;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) {
        _preloadNearbyImages();
        _startCarouselTimer();
        if (widget.initialScrollTarget != null) {
          scrollToItem(widget.initialScrollTarget!);
        }
      }
    });
  }

  void _startCarouselTimer() {
    _carouselTimer?.cancel();
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_disposed && mounted) {
        goToNext();
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _carouselTimer?.cancel();
    _scrollController.dispose();
    _loadedImages.clear();
    _loadingImages.clear();
    _failedImages.clear();
    super.dispose();
  }

  Widget _buildCarouselImage() {
    final imageProvider = _loadedImages[currentIndex];
    final isLoading = _loadingImages.contains(currentIndex);
    final hasFailed = _failedImages.contains(currentIndex);

    if (hasFailed) {
      return Container(
        color: Colors.grey[300],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, size: 50, color: Colors.grey),
              SizedBox(height: 8),
              Text('Image not available', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    if (isLoading || imageProvider == null) {
      return Container(
        color: Colors.grey[100],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.green),
              SizedBox(height: 16),
              Text('Loading...', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image(
        key: ValueKey(currentIndex),
        image: imageProvider,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          if (!_disposed && mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _failedImages.add(currentIndex);
                _loadedImages.remove(currentIndex);
              });
            });
          }
          return Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image_not_supported, size: 50),
            ),
          );
        },
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
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: _buildCarouselImage(),
                ),
                Positioned(
                  left: 20,
                  child: _navArrow(Icons.arrow_back_ios, goToPrevious),
                ),
                Positioned(
                  right: 20,
                  child: _navArrow(Icons.arrow_forward_ios, goToNext),
                ),
                Positioned(bottom: 20, child: _buildDotsIndicator()),
                if (_loadingImages.contains(currentIndex))
                  Positioned(top: 20, right: 20, child: _loadingOverlay()),
              ],
            ),
          ),
          AboutUS(key: aboutKey),
          // const Services(), // No scroll key
          ContactUsSection(key: contactKey),
        ],
      ),
    );
  }

  Widget _navArrow(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          images.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentIndex == index ? 24 : 12,
            height: 4,
            decoration: BoxDecoration(
              color: currentIndex == index ? Colors.green : Colors.white70,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingOverlay() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      ),
    );
  }
}
