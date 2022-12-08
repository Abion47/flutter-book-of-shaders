import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Colors3Page extends StaticPage {
  const Colors3Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/colors-3.glsl';

  @override
  ShaderPainter shaderPainter() => _Colors3Painter();
}

class _Colors3Painter extends ShaderPainter {
  _Colors3Painter() : super(shader: UserShaders.AlgorithmicDrawing.colors3);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
