import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _SVGPainter extends CustomPainter {
  final List<Path> paths;

  _SVGPainter(this.paths);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (final path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Since the painter won't change
  }
}

