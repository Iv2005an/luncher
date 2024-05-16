import 'package:flutter/material.dart';

import 'abstract_icon.dart';

class UserLocationIcon extends AbstractIcon {
  UserLocationIcon() : super(const Size(50, 50));
  @override
  Future<void> draw() async {
    final radius = iconSize.width / 2;
    canvas.drawCircle(
        Offset(radius, radius),
        radius,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red);
    canvas.drawCircle(
        Offset(radius, radius),
        radius * 0.95,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.white
          ..strokeWidth = radius * 0.1);
  }
}
