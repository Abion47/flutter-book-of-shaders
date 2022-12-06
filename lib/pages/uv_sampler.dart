import 'package:flutter/material.dart';

import '../base/shader_painter_wrapper.dart';
import '../painters/uv_sampler_painter.dart';

class UVSamplerPage extends StatelessWidget {
  const UVSamplerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'misc/uv-sampler.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: UVSamplerPainter()),
      ],
    );
  }
}
