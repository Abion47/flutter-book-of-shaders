import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class ShapingFunctions3Page extends AnimatedPage {
  const ShapingFunctions3Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shaping-functions-3.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) =>
      _ShapingFunctions3Painter(time);
}

class _ShapingFunctions3Painter extends AnimatedShaderPainter {
  _ShapingFunctions3Painter(super.time)
      : super(shader: UserShaders.AlgorithmicDrawing.shapingFunctions3);

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
