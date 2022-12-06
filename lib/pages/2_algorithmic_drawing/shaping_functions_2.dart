import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';
import '../animated_page.dart';

class ShapingFunctions2Page extends AnimatedPage {
  const ShapingFunctions2Page({super.key});

  @override
  Widget buildPage(BuildContext context, double time, double deltaTime) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '2-algorithmic-drawing/shaping-functions-2.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: _ShapingFunctions2Painter(time)),
        Text(
          'time: ${time.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}

class _ShapingFunctions2Painter extends ShaderPainter {
  _ShapingFunctions2Painter(this.time)
      : super(shader: UserShaders.AlgorithmicDrawing.shapingFunctions2);

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
