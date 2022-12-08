import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes3Page extends StaticPage {
  const Shapes3Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-3.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes3Painter();
}

class _Shapes3Painter extends ShaderPainter {
  _Shapes3Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes3);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
