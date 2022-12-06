import 'package:flutter/material.dart';

import 'main_menu_page.dart';
import 'pages/1_getting_started/hello_world.dart';
import 'pages/1_getting_started/uniforms_1.dart';
import 'pages/1_getting_started/uniforms_2.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_1.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_2.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_3.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_4.dart';
import 'pages/misc/creation.dart';
import 'pages/misc/simple.dart';
import 'pages/misc/simplex_3d.dart';
import 'pages/misc/uv_sampler.dart';

final routes = <String, Widget Function(BuildContext)>{
  '/': (_) => const MainMenuPage(),
  //
  '/1-getting-started/hello-world': (_) => const HelloWorldPage(),
  '/1-getting-started/uniforms-1': (_) => const Uniforms1Page(),
  '/1-getting-started/uniforms-2': (_) => const Uniforms2Page(),
  //
  '/2-algorithmic-drawing/shaping-functions-1': (_) =>
      const ShapingFunctions1Page(),
  '/2-algorithmic-drawing/shaping-functions-2': (_) =>
      const ShapingFunctions2Page(),
  '/2-algorithmic-drawing/shaping-functions-3': (_) =>
      const ShapingFunctions3Page(),
  '/2-algorithmic-drawing/shaping-functions-4': (_) =>
      const ShapingFunctions4Page(),
  //
  '/misc/simple': (_) => const SimplePage(),
  '/misc/uv-sampler': (_) => const UVSamplerPage(),
  '/misc/simplex-3d': (_) => const Simplex3DPage(),
  '/misc/creation': (_) => const CreationPage(),
};
