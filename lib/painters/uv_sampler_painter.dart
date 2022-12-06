import 'package:flutter/material.dart';

import '../base/shader_painter.dart';
import '../shaders/user_shaders.g.dart';

class UVSamplerPainter extends ShaderPainter {
  UVSamplerPainter() : super(shader: UserShaders.Misc.uvSampler);

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
