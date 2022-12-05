import 'package:flutter/material.dart';

import 'shader_painter.dart';
import 'shaders/user_shaders.g.dart';

class FlutterShaderTest extends StatelessWidget {
  const FlutterShaderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: ShaderPainter(shader: UserShaders.simple),
          ),
        ),
      ),
    );
  }
}
