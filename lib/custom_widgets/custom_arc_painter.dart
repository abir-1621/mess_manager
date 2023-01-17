import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/globalcolors.dart';

class MyArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = appPrimaryCol
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Draw the first arc
    double startAngle = 0;
    double endAngle = pi - ((pi / 180) * 20);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        endAngle, false, paint);
    // Draw the second arc
    paint.color = appSecondaryCol;
    startAngle = pi;
    endAngle = pi - ((pi / 180) * 20);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        endAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
