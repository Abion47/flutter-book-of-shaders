import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Shapes5Page extends StaticPage {
  const Shapes5Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/shapes-5.glsl';

  @override
  ShaderPainter shaderPainter() => _Shapes5Painter();
}

class _Shapes5Painter extends ShaderPainter {
  _Shapes5Painter() : super(shader: UserShaders.AlgorithmicDrawing.shapes5);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
