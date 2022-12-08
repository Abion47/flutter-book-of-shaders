import 'package:flutter/material.dart';

import '../../base/animated_page.dart';
import '../../base/shader_painter.dart';
import '../../shaders/user_shaders.g.dart';

class OblivionRadarPage extends AnimatedPage {
  const OblivionRadarPage({super.key});

  @override
  String get title => 'misc/oblivion-radar.glsl';

  @override
  AnimatedShaderPainter shaderPainter(double time) =>
      _OblivionRadarPainter(time);
}

class _OblivionRadarPainter extends AnimatedShaderPainter {
  _OblivionRadarPainter(super.time)
      : super(shader: UserShaders.Misc.oblivionRadar);

  @override
  void paint(Canvas canvas, Size size) {
    // u_resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    // u_time
    shader.setFloat(2, time);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
