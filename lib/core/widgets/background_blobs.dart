import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundDecorations extends StatelessWidget {
  const BackgroundDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Stack(
      children: [
        // Blue Blob Top Right
        Positioned(
          top: -100,
          right: -100,
          child: _Blob(
            size: 400,
            color: Colors.blue.withOpacity(0.15),
          ),
        ),
        
        // Cyan Blob Middle Left
        Positioned(
          top: size.height * 0.4,
          left: -150,
          child: _Blob(
            size: 500,
            color: Colors.cyan.withOpacity(0.1),
          ),
        ),
        
        // Indigo Blob Bottom Right
        Positioned(
          bottom: -150,
          right: -50,
          child: _Blob(
            size: 600,
            color: Colors.indigo.withOpacity(0.12),
          ),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;

  const _Blob({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
