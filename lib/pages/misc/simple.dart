import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'misc/simple.glsl',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
          Slider(
            min: 0,
            max: 1,
            value: value,
            onChanged: (val) => setState(() => value = val),
          ),
          ShaderWrapper(painter: _SimplePainter(value)),
        ],
      ),
    );
  }
}

class _SimplePainter extends ShaderPainter {
  _SimplePainter(this.i) : super(shader: UserShaders.Misc.simple);

  final double i;

  @override
  void paint(Canvas canvas, Size size) {
    // u_a
    shader.setFloat(0, i);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
