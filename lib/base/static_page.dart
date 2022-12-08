import 'package:flutter/material.dart';

import 'shader_painter.dart';
import 'shader_painter_wrapper.dart';

abstract class StaticPage extends StatelessWidget {
  const StaticPage({super.key});

  String get title;
  ShaderPainter shaderPainter();

  List<Widget> buildPageChildren(BuildContext context) => [];

  @override
  Widget build(BuildContext context) {
    final children = buildPageChildren(context);
    return Scaffold(
      appBar: AppBar(),
      body: FractionallySizedBox(
        widthFactor: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 32),
            ),
            ShaderWrapper(painter: shaderPainter()),
            ...children,
          ],
        ),
      ),
    );
  }
}
