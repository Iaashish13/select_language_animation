import 'dart:math' as math;

import 'package:flutter/material.dart';

class CirclePainer extends CustomPainter {
  CirclePainer(this.arcPainting, this.color);
  double? arcPainting;
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 100, 100);
    const startAngle = -math.pi;
    // final sweepAngle = math.pi;
    final sweepAngle = arcPainting ?? math.pi;
    const useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..color = color
      ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
