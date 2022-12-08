import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Random1Page extends StaticPage {
  const Random1Page({super.key});

  @override
  String get title => '3-generative-designs/random-1.glsl';

  @override
  ShaderPainter shaderPainter() => _Random1Painter();
}

class _Random1Painter extends ShaderPainter {
  _Random1Painter() : super(shader: UserShaders.GenerativeDesigns.random1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
