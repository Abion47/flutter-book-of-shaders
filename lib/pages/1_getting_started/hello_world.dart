import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';
import '../static_page.dart';

class HelloWorldPage extends StaticPage {
  const HelloWorldPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '1-getting-started/hello-world.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: _HelloWorldPainter()),
      ],
    );
  }
}

class _HelloWorldPainter extends ShaderPainter {
  _HelloWorldPainter() : super(shader: UserShaders.GettingStarted.helloWorld);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
