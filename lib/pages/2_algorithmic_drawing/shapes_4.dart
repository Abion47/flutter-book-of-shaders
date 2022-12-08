import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes4Page extends StaticPage {
  const Shapes4Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-4.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes4Painter();
}

class _Shapes4Painter extends ShaderPainter {
  _Shapes4Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes4);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
