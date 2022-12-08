import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Colors2Page extends StaticPage {
  const Colors2Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/colors-2.glsl';

  @override
  ShaderPainter shaderPainter() => _Colors2Painter();
}

class _Colors2Painter extends ShaderPainter {
  _Colors2Painter() : super(shader: UserShaders.AlgorithmicDrawing.colors2);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
