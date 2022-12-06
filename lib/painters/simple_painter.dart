import 'package:flutter/material.dart';

import '../base/shader_painter.dart';
import '../shaders/user_shaders.g.dart';

class SimplePainter extends ShaderPainter {
  SimplePainter(this.i) : super(shader: UserShaders.simple);

  final double i;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, i);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
