import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';
import '../animated_page.dart';

class CreationPage extends AnimatedPage {
  const CreationPage({super.key});

  @override
  Widget buildPage(BuildContext context, double time, double deltaTime) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'misc/creation.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: _CreationPainter(time)),
        Text(
          'time: ${time.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}

class _CreationPainter extends ShaderPainter {
  _CreationPainter(this.time) : super(shader: UserShaders.Misc.creation);

  final double time;

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
