import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SmoothFade extends StatefulWidget {
  final Widget child;
  const SmoothFade({super.key, required this.child});

  @override
  State<SmoothFade> createState() => _SmoothFadeState();
}

class _SmoothFadeState extends State<SmoothFade> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        // Trigger if 20% of the section is visible
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: widget.child
          .animate(target: _isVisible ? 1 : 0)
          .fadeIn(duration: 800.ms, curve: Curves.easeOutCubic)
          .slideY(begin: 0.1, end: 0, duration: 800.ms),
    );
  }
}