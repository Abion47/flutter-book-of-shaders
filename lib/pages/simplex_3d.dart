import 'package:flutter/material.dart';

import '../base/shader_painter_wrapper.dart';
import '../painters/simplex_3d_painter.dart';

class Simplex3DPage extends StatefulWidget {
  const Simplex3DPage({super.key});

  @override
  State<Simplex3DPage> createState() => _Simplex3DPageState();
}

class _Simplex3DPageState extends State<Simplex3DPage> {
  double start = 0;
  double time = 0;

  @override
  void initState() {
    start = DateTime.now().millisecondsSinceEpoch / 1000;
    super.initState();
  }

  void onFrame() {
    final frame = DateTime.now().millisecondsSinceEpoch / 1000;
    time = frame - start;

    Future.microtask(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    onFrame();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'simplex-3d.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: Simplex3DPainter(time)),
        Text(
          'time: ${time.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
