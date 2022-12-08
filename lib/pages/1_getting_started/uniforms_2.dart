import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class Uniforms2Page extends StaticPage {
  const Uniforms2Page({super.key});

  @override
  String get title => '1-getting-started/uniforms-2.glsl';

  @override
  ShaderPainter shaderPainter() => _Uniforms2Painter();
}

class _Uniforms2Painter extends ShaderPainter {
  _Uniforms2Painter() : super(shader: UserShaders.GettingStarted.uniforms2);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
