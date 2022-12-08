import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class Simplex3DPage extends AnimatedPage {
  const Simplex3DPage({super.key});

  @override
  String get title => 'misc/simplex-3d.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) => _Simplex3DPainter(time);
}

class _Simplex3DPainter extends AnimatedShaderPainter {
  _Simplex3DPainter(super.time) : super(shader: UserShaders.Misc.simplex3d);

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
