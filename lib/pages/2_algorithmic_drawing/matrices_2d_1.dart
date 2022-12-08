import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class Matrices2d1Page extends AnimatedPage {
  const Matrices2d1Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/matrices-2d-1.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) => _Matrices2D1Painter(time);
}

class _Matrices2D1Painter extends AnimatedShaderPainter {
  _Matrices2D1Painter(super.time)
      : super(shader: UserShaders.AlgorithmicDrawing.matrices2d1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    // u_time
    shader.setFloat(2, time);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
