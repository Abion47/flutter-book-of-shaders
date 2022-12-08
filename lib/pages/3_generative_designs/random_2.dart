import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Random2Page extends StaticPage {
  const Random2Page({super.key});

  @override
  String get title => '3-generative-designs/random-2.glsl';

  @override
  ShaderPainter shaderPainter() => _Random2Painter();
}

class _Random2Painter extends ShaderPainter {
  _Random2Painter() : super(shader: UserShaders.GenerativeDesigns.random2);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
