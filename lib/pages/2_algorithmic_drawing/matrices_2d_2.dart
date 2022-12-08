import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class Matrices2d2Page extends AnimatedPage {
  const Matrices2d2Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/matrices-2d-2.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) => _Matrices2D2Painter(time);
}

class _Matrices2D2Painter extends AnimatedShaderPainter {
  _Matrices2D2Painter(super.time)
      : super(shader: UserShaders.AlgorithmicDrawing.matrices2d2);

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
