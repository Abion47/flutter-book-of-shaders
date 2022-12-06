import 'package:flutter/material.dart';

import '../../base/shader_painter.dart';
import '../../base/shader_painter_wrapper.dart';
import '../../shaders/user_shaders.g.dart';
import '../static_page.dart';

class UVSamplerPage extends StaticPage {
  const UVSamplerPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'misc/uv-sampler.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: _UVSamplerPainter()),
      ],
    );
  }
}

class _UVSamplerPainter extends ShaderPainter {
  _UVSamplerPainter() : super(shader: UserShaders.Misc.uvSampler);

  @override
  void paint(Canvas canvas, Size size) {
    // u_size
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(Offset.zero & size, shaderPaint);
  }
}
