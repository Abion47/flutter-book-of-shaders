import 'package:flutter/material.dart';

import '../base/shader_painter.dart';
import '../shaders/user_shaders.g.dart';

class Simplex3DPainter extends ShaderPainter {
  Simplex3DPainter(this.time) : super(shader: UserShaders.simplex3d);

  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
