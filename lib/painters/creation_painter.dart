import 'package:flutter/material.dart';

import '../base/shader_painter.dart';
import '../shaders/user_shaders.g.dart';

class CreationPainter extends ShaderPainter {
  CreationPainter(this.time) : super(shader: UserShaders.Misc.creation);

  final double time;

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
