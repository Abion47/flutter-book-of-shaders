import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              NavHeader('1. Getting Started'),
              //
              NavButton(
                text: 'Hello World',
                route: ('/1-getting-started/hello-world'),
              ),
              NavButton(
                text: 'Uniforms 1',
                route: ('/1-getting-started/uniforms-1'),
              ),
              NavButton(
                text: 'Uniforms 2',
                route: ('/1-getting-started/uniforms-2'),
              ),
              //
              NavHeader('2. Algorithmic Drawing'),
              //
              NavButton(
                text: 'Shaping Functions 1',
                route: ('/2-algorithmic-drawing/shaping-functions-1'),
              ),
              NavButton(
                text: 'Shaping Functions 2',
                route: ('/2-algorithmic-drawing/shaping-functions-2'),
              ),
              NavButton(
                text: 'Shaping Functions 3',
                route: ('/2-algorithmic-drawing/shaping-functions-3'),
              ),
              NavButton(
                text: 'Shaping Functions 4',
                route: ('/2-algorithmic-drawing/shaping-functions-4'),
              ),
              //
              NavHeader('Miscellaneous'),
              //
              NavButton(
                text: 'Simple',
                route: ('/misc/simple'),
              ),
              NavButton(
                text: 'UV Sampler',
                route: ('/misc/uv-sampler'),
              ),
              NavButton(
                text: 'Simplex 3D Noise',
                route: '/misc/simplex-3d',
              ),
              NavButton(
                text: '"Creation" by Silexars',
                route: '/misc/creation',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  const NavHeader(this.text, {super.key});

  static const headerStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: headerStyle);
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.text,
    required this.route,
  });

  static const buttonStyle = TextStyle(
    fontSize: 24,
  );

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(route),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: buttonStyle),
        ),
      ),
    );
  }
}
