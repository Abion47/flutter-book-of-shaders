import 'package:flutter/material.dart';

import '../base/shader_painter_wrapper.dart';
import '../painters/simple_painter.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        ShaderWrapper(painter: SimplePainter(value)),
      ],
    );
  }
}
