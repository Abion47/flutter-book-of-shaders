import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class CreationPage extends AnimatedPage {
  const CreationPage({super.key});

  @override
  String get title => 'misc/creation.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) => _CreationPainter(time);
}

class _CreationPainter extends AnimatedShaderPainter {
  _CreationPainter(super.time) : super(shader: UserShaders.Misc.creation);

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
