import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Patterns3Page extends StaticPage {
  const Patterns3Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/patterns-3.glsl';

  @override
  ShaderPainter shaderPainter() => _Patterns3Painter();
}

class _Patterns3Painter extends ShaderPainter {
  _Patterns3Painter() : super(shader: UserShaders.AlgorithmicDrawing.patterns3);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
