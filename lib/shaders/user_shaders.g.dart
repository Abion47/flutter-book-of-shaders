// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, camel_case_types

import 'dart:ui';

final UserShaders = _$UserShaders();

class _$UserShaders {
  final Basic = _$Basic();
  final Colors = _$Colors();

  late final FragmentShader simpleVariant;
  late final FragmentShader simple;

  Future<void> initialize() async {
    simpleVariant =
        (await FragmentProgram.fromAsset('assets/shaders/simple-variant.sprv'))
            .fragmentShader();
    simple = (await FragmentProgram.fromAsset('assets/shaders/simple.sprv'))
        .fragmentShader();

    await Basic.initialize();
    await Colors.initialize();
  }
}

class _$Basic {
  late final FragmentShader simple;

  Future<void> initialize() async {
    simple =
        (await FragmentProgram.fromAsset('assets/shaders/basic/simple.sprv'))
            .fragmentShader();
  }
}

class _$Colors {
  final Colors2 = _$Colors_Colors2();

  late final FragmentShader simpleVariant;
  late final FragmentShader simple;

  Future<void> initialize() async {
    simpleVariant = (await FragmentProgram.fromAsset(
            'assets/shaders/colors/simple-variant.sprv'))
        .fragmentShader();
    simple =
        (await FragmentProgram.fromAsset('assets/shaders/colors/simple.sprv'))
            .fragmentShader();

    await Colors2.initialize();
  }
}

class _$Colors_Colors2 {
  late final FragmentShader simple;

  Future<void> initialize() async {
    simple = (await FragmentProgram.fromAsset(
            'assets/shaders/colors/colors-2/simple.sprv'))
        .fragmentShader();
  }
}
