import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/static_page.dart';
import '../../shaders/user_shaders.g.dart';

class HelloWorldPage extends StaticPage {
  const HelloWorldPage({super.key});

  @override
  String get title => '1-getting-started/hello-world.glsl';

  @override
  ShaderPainter shaderPainter() => _HelloWorldPainter();
}

class _HelloWorldPainter extends ShaderPainter {
  _HelloWorldPainter() : super(shader: UserShaders.GettingStarted.helloWorld);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
