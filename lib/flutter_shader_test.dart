import 'package:flutter/material.dart';

import 'pages/creation.dart';
import 'pages/simple.dart';
import 'pages/simplex_3d.dart';
import 'pages/uv_sampler.dart';

class FlutterShaderTest extends StatefulWidget {
  const FlutterShaderTest({super.key});

  @override
  State<FlutterShaderTest> createState() => _FlutterShaderTestState();
}

class _FlutterShaderTestState extends State<FlutterShaderTest> {
  late final PageController controller;

  final pages = const [
    SimplePage(),
    UVSamplerPage(),
    Simplex3DPage(),
    CreationPage(),
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
    );
  }

  Widget wrapPage(Widget page) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) => setState(() => currentPage = value),
                children: pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        size: 35,
                      ),
                      onPressed: currentPage <= 0
                          ? null
                          : () => controller.previousPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOut,
                              ),
                    ),
                    const Spacer(),
                    IconButton(
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 35,
                      ),
                      onPressed: currentPage + 1 >= pages.length
                          ? null
                          : () => controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOut,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
