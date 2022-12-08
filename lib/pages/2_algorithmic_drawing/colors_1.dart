import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class Colors1Page extends AnimatedPage {
  const Colors1Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/colors-1.glsl';
  @override
  AnimatedShaderPainter shaderPainter(double time) => _Colors1Painter(time);
}

class _Colors1Painter extends AnimatedShaderPainter {
  _Colors1Painter(super.time)
      : super(shader: UserShaders.AlgorithmicDrawing.colors1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_time
    shader.setFloat(0, time);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
