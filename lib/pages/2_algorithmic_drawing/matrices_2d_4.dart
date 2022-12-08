import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Matrices2d4Page extends StaticPage {
  const Matrices2d4Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/matrices-2d-4.glsl';

  @override
  ShaderPainter shaderPainter() => _Matrices2D4Painter();
}

class _Matrices2D4Painter extends ShaderPainter {
  _Matrices2D4Painter()
      : super(shader: UserShaders.AlgorithmicDrawing.matrices2d4);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
