import 'package:flutter/material.dart';

import '../base/shader_painter.dart';
import '../shaders/user_shaders.g.dart';

class SimpleVariantPainter extends ShaderPainter {
  SimpleVariantPainter(this.i) : super(shader: UserShaders.simpleVariant);

  final double i;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, i);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
