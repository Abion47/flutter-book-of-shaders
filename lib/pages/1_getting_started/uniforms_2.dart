import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';
import '../static_page.dart';

class Uniforms2Page extends StaticPage {
  const Uniforms2Page({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '1-getting-started/uniforms-2.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: _Uniforms2Painter()),
      ],
    );
  }
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
