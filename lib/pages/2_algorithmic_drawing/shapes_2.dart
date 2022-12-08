import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes2Page extends StaticPage {
  const Shapes2Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-2.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes2Painter();
}

class _Shapes2Painter extends ShaderPainter {
  _Shapes2Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes2);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
