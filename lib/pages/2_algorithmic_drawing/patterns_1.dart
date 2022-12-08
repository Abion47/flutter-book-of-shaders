import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Patterns1Page extends StaticPage {
  const Patterns1Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/patterns-1.glsl';

  @override
  ShaderPainter shaderPainter() => _Patterns1Painter();
}

class _Patterns1Painter extends ShaderPainter {
  _Patterns1Painter() : super(shader: UserShaders.AlgorithmicDrawing.patterns1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
