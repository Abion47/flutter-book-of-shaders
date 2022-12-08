import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes1Page extends StaticPage {
  const Shapes1Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-1.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes1Painter();
}

class _Shapes1Painter extends ShaderPainter {
  _Shapes1Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
