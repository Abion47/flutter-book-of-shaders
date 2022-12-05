import 'package:flutter/material.dart';

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader}) : _paint = Paint()..shader = shader;

  final Shader shader;

  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & const Size(100, 100), _paint);
  }

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) => true;
}
