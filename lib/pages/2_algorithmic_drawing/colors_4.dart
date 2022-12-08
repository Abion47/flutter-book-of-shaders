import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Colors4Page extends StaticPage {
  const Colors4Page({super.key});

  @override
  String get title => '2-algorithmic-drawing/colors-4.glsl';

  @override
  ShaderPainter shaderPainter() => _Colors4Painter();
}

class _Colors4Painter extends ShaderPainter {
  _Colors4Painter() : super(shader: UserShaders.AlgorithmicDrawing.colors4);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
