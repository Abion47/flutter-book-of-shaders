import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Patterns4Page extends StaticPage {
  const Patterns4Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/patterns-4.glsl';

  @override
  ShaderPainter shaderPainter() => _Patterns4Painter();
}

class _Patterns4Painter extends ShaderPainter {
  _Patterns4Painter() : super(shader: UserShaders.AlgorithmicDrawing.patterns4);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
