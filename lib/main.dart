import 'package:flutter/material.dart';

import 'shader_app.dart';
import 'shaders/user_shaders.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserShaders.initialize();

  runApp(const ShaderApp());
}
