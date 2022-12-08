import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class ShapingFunctions1Page extends AnimatedPage {
  const ShapingFunctions1Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shaping-functions-1.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) =>
      _ShapingFunctions1Painter(time);
}

class _ShapingFunctions1Painter extends AnimatedShaderPainter {
  _ShapingFunctions1Painter(super.time)
      : super(shader: UserShaders.AlgorithmicDrawing.shapingFunctions1);

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
