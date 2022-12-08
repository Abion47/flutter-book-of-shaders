import 'package:flutter/material.dart';

import 'main_menu_page.dart';
import 'pages/1_getting_started/hello_world.dart';
import 'pages/1_getting_started/uniforms_1.dart';
import 'pages/1_getting_started/uniforms_2.dart';
import 'pages/2_algorithmic_drawing/colors_1.dart';
import 'pages/2_algorithmic_drawing/colors_2.dart';
import 'pages/2_algorithmic_drawing/colors_3.dart';
import 'pages/2_algorithmic_drawing/colors_4.dart';
import 'pages/2_algorithmic_drawing/matrices_2d_1.dart';
import 'pages/2_algorithmic_drawing/matrices_2d_2.dart';
import 'pages/2_algorithmic_drawing/matrices_2d_3.dart';
import 'pages/2_algorithmic_drawing/matrices_2d_4.dart';
import 'pages/2_algorithmic_drawing/patterns_1.dart';
import 'pages/2_algorithmic_drawing/patterns_2.dart';
import 'pages/2_algorithmic_drawing/patterns_3.dart';
import 'pages/2_algorithmic_drawing/patterns_4.dart';
import 'pages/2_algorithmic_drawing/shapes_1.dart';
import 'pages/2_algorithmic_drawing/shapes_2.dart';
import 'pages/2_algorithmic_drawing/shapes_3.dart';
import 'pages/2_algorithmic_drawing/shapes_4.dart';
import 'pages/2_algorithmic_drawing/shapes_5.dart';
import 'pages/2_algorithmic_drawing/shapes_6.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_1.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_2.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_3.dart';
import 'pages/2_algorithmic_drawing/shaping_functions_4.dart';
import 'pages/3_generative_designs/random_1.dart';
import 'pages/3_generative_designs/random_2.dart';
import 'pages/3_generative_designs/random_3.dart';
import 'pages/misc/creation.dart';
import 'pages/misc/oblivion_radar.dart';
import 'pages/misc/simplex_3d.dart';

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
  '/2-algorithmic-drawing/colors-1': (_) => const Colors1Page(),
  '/2-algorithmic-drawing/colors-2': (_) => const Colors2Page(),
  '/2-algorithmic-drawing/colors-3': (_) => const Colors3Page(),
  '/2-algorithmic-drawing/colors-4': (_) => const Colors4Page(),
  '/2-algorithmic-drawing/shapes-1': (_) => const Shapes1Page(),
  '/2-algorithmic-drawing/shapes-2': (_) => const Shapes2Page(),
  '/2-algorithmic-drawing/shapes-3': (_) => const Shapes3Page(),
  '/2-algorithmic-drawing/shapes-4': (_) => const Shapes4Page(),
  '/2-algorithmic-drawing/shapes-5': (_) => const Shapes5Page(),
  '/2-algorithmic-drawing/shapes-6': (_) => const Shapes6Page(),
  '/2-algorithmic-drawing/2d-matrices-1': (_) => const Matrices2d1Page(),
  '/2-algorithmic-drawing/2d-matrices-2': (_) => const Matrices2d2Page(),
  '/2-algorithmic-drawing/2d-matrices-3': (_) => const Matrices2d3Page(),
  '/2-algorithmic-drawing/2d-matrices-4': (_) => const Matrices2d4Page(),
  '/2-algorithmic-drawing/patterns-1': (_) => const Patterns1Page(),
  '/2-algorithmic-drawing/patterns-2': (_) => const Patterns2Page(),
  '/2-algorithmic-drawing/patterns-3': (_) => const Patterns3Page(),
  '/2-algorithmic-drawing/patterns-4': (_) => const Patterns4Page(),
  //
  '/3-generative-designs/random-1': (_) => const Random1Page(),
  '/3-generative-designs/random-2': (_) => const Random2Page(),
  '/3-generative-designs/random-3': (_) => const Random3Page(),
  //
  '/misc/simplex-3d': (_) => const Simplex3DPage(),
  '/misc/creation': (_) => const CreationPage(),
  '/misc/oblivion-radar': (_) => const OblivionRadarPage(),
};
