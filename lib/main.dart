import 'package:flutter/material.dart';

import 'flutter_shader_test.dart';
import 'shaders/user_shaders.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserShaders.initialize();

  runApp(const FlutterShaderTest());
}
