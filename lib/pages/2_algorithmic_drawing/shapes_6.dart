import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes6Page extends StaticPage {
  const Shapes6Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-6.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes6Painter();
}

class _Shapes6Painter extends ShaderPainter {
  _Shapes6Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes6);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
