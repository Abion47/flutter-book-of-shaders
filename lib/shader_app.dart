import 'package:flutter/material.dart';

import 'routes.dart';

class ShaderApp extends StatelessWidget {
  const ShaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
