import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ShaderPainter extends CustomPainter {
  ShaderPainter({
    required this.shader,
  }) : shaderPaint = Paint()..shader = shader;

  final FragmentShader shader;
  final Paint shaderPaint;

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => true;
}

abstract class AnimatedShaderPainter extends ShaderPainter {
  AnimatedShaderPainter(
    this.time, {
    required super.shader,
  });

  final double time;

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => true;
}
