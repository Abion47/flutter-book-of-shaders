import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Random3Page extends StaticPage {
  const Random3Page({super.key});

  @override
  String get title => '3-generative-designs/random-3.glsl';

  @override
  ShaderPainter shaderPainter() => _Random3Painter();
}

class _Random3Painter extends ShaderPainter {
  _Random3Painter() : super(shader: UserShaders.GenerativeDesigns.random3);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
