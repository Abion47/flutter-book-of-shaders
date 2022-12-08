import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Patterns2Page extends StaticPage {
  const Patterns2Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/patterns-2.glsl';

  @override
  ShaderPainter shaderPainter() => _Patterns2Painter();
}

class _Patterns2Painter extends ShaderPainter {
  _Patterns2Painter() : super(shader: UserShaders.AlgorithmicDrawing.patterns2);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
