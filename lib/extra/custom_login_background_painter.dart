import 'package:flutter/material.dart';

class CustomLoginBackgroundPainter extends CustomPainter {
  final Color color;

  CustomLoginBackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..style = PaintingStyle.fill
      //..strokeWidth = 1
      ..color = color;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 30, size.width / 2, size.height);
    path.quadraticBezierTo(
        (size.width / 4) * 3, size.height + 30, size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
