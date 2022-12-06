import 'package:flutter/material.dart';

import '../base/shader_painter_wrapper.dart';
import '../painters/simple_variant_painter.dart';

class SimpleVariantPage extends StatefulWidget {
  const SimpleVariantPage({super.key});

  @override
  State<SimpleVariantPage> createState() => _SimpleVariantPageState();
}

class _SimpleVariantPageState extends State<SimpleVariantPage> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'simple-variant.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        Slider(
          min: 0,
          max: 1,
          value: value,
          onChanged: (val) => setState(() => value = val),
        ),
        ShaderWrapper(painter: SimpleVariantPainter(value)),
      ],
    );
  }
}
