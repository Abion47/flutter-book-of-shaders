import 'package:flutter/material.dart';

class ShaderWrapper extends StatelessWidget {
  const ShaderWrapper({super.key, required this.painter});

  final CustomPainter painter;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: CustomPaint(
            painter: painter,
          ),
        ),
      ),
    );
  }
}
