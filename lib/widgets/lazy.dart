// import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class LazyLoadWrapper extends StatefulWidget {
//   final Widget child;
//   final Duration duration;

//   const LazyLoadWrapper({
//     super.key,
//     required this.child,
//     this.duration = const Duration(milliseconds: 500),
//   });

//   @override
//   State<LazyLoadWrapper> createState() => _LazyLoadWrapperState();
// }

// class _LazyLoadWrapperState extends State<LazyLoadWrapper> {
//   bool _isVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: Key(widget.child.hashCode.toString()),
//       onVisibilityChanged: (info) {
//         if (info.visibleFraction > 0.1 && !_isVisible) {
//           setState(() => _isVisible = true);
//         }
//       },
//       child: AnimatedOpacity(
//         duration: widget.duration,
//         opacity: _isVisible ? 1.0 : 0.0,
//         child: Offstage(offstage: !_isVisible, child: widget.child),
//       ),
//     );
//   }
// }
