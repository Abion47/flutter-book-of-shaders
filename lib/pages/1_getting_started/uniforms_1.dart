import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class Uniforms1Page extends AnimatedPage {
  const Uniforms1Page({super.key});

  @override
  String get title => '1-getting-started/uniforms-1.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) => _Uniforms1Painter(time);
}

class _Uniforms1Painter extends AnimatedShaderPainter {
  _Uniforms1Painter(super.time)
      : super(shader: UserShaders.GettingStarted.uniforms1);

  @override
  void paint(Canvas canvas, Size size) {
    // u_time
    shader.setFloat(0, time);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
