// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, camel_case_types

import 'dart:ui';

final UserShaders = _$UserShaders();

class _$UserShaders {
  final Basic = _$Basic();
  final Colors = _$Colors();

  late final FragmentShader simpleVariant;
  late final FragmentShader simple;
  late final FragmentShader simplex3d;
  late final FragmentShader uvSampler;

  Future<void> initialize() async {
    simpleVariant =
        (await FragmentProgram.fromAsset('shaders/src/simple-variant.glsl'))
            .fragmentShader();
    simple = (await FragmentProgram.fromAsset('shaders/src/simple.glsl'))
        .fragmentShader();
    simplex3d = (await FragmentProgram.fromAsset('shaders/src/simplex-3d.glsl'))
        .fragmentShader();
    uvSampler = (await FragmentProgram.fromAsset('shaders/src/uv-sampler.glsl'))
        .fragmentShader();

    await Basic.initialize();
    await Colors.initialize();
  }
}

class _$Basic {
  late final FragmentShader simple;

  Future<void> initialize() async {
    simple = (await FragmentProgram.fromAsset('shaders/src/basic/simple.glsl'))
        .fragmentShader();
  }
}

class _$Colors {
  final Colors2 = _$Colors_Colors2();

  late final FragmentShader simpleVariant;
  late final FragmentShader simple;

  Future<void> initialize() async {
    simpleVariant = (await FragmentProgram.fromAsset(
            'shaders/src/colors/simple-variant.glsl'))
        .fragmentShader();
    simple = (await FragmentProgram.fromAsset('shaders/src/colors/simple.glsl'))
        .fragmentShader();

    await Colors2.initialize();
  }
}

class _$Colors_Colors2 {
  late final FragmentShader simple;

  Future<void> initialize() async {
    simple = (await FragmentProgram.fromAsset(
            'shaders/src/colors/colors-2/simple.glsl'))
        .fragmentShader();
  }
}
