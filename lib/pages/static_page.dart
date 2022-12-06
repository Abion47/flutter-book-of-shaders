import 'package:flutter/material.dart';

abstract class StaticPage extends StatelessWidget {
  const StaticPage({super.key});

  Widget buildPage(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final child = buildPage(context);
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }
}
