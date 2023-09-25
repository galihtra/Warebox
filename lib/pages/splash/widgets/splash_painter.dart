import 'package:flutter/material.dart';

class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white // Mengubah warna latar belakang menjadi putih
      ..style = PaintingStyle.fill;

    var path = Path();

    // Buat latar belakang persegi panjang
    path.addRect(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
