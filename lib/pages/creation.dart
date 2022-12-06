import 'package:flutter/material.dart';

import '../base/shader_painter_wrapper.dart';
import '../painters/creation_painter.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
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

    Future.microtask(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    onFrame();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'misc/creation.glsl',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
        ShaderWrapper(painter: CreationPainter(time)),
        Text(
          'time: ${time.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
