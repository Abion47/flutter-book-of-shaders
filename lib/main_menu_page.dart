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
              NavButton(
                text: 'Colors 1',
                route: ('/2-algorithmic-drawing/colors-1'),
              ),
              NavButton(
                text: 'Colors 2',
                route: ('/2-algorithmic-drawing/colors-2'),
              ),
              NavButton(
                text: 'Colors 3',
                route: ('/2-algorithmic-drawing/colors-3'),
              ),
              NavButton(
                text: 'Colors 4',
                route: ('/2-algorithmic-drawing/colors-4'),
              ),
              NavButton(
                text: 'Shapes 1',
                route: ('/2-algorithmic-drawing/shapes-1'),
              ),
              NavButton(
                text: 'Shapes 2',
                route: ('/2-algorithmic-drawing/shapes-2'),
              ),
              NavButton(
                text: 'Shapes 3',
                route: ('/2-algorithmic-drawing/shapes-3'),
              ),
              NavButton(
                text: 'Shapes 4',
                route: ('/2-algorithmic-drawing/shapes-4'),
              ),
              NavButton(
                text: 'Shapes 5',
                route: ('/2-algorithmic-drawing/shapes-5'),
              ),
              NavButton(
                text: 'Shapes 6',
                route: ('/2-algorithmic-drawing/shapes-6'),
              ),
              NavButton(
                text: '2D Matrices 1',
                route: ('/2-algorithmic-drawing/2d-matrices-1'),
              ),
              NavButton(
                text: '2D Matrices 2',
                route: ('/2-algorithmic-drawing/2d-matrices-2'),
              ),
              NavButton(
                text: '2D Matrices 3',
                route: ('/2-algorithmic-drawing/2d-matrices-3'),
              ),
              NavButton(
                text: '2D Matrices 4',
                route: ('/2-algorithmic-drawing/2d-matrices-4'),
              ),
              NavButton(
                text: 'Patterns 1',
                route: ('/2-algorithmic-drawing/patterns-1'),
              ),
              NavButton(
                text: 'Patterns 2',
                route: ('/2-algorithmic-drawing/patterns-2'),
              ),
              NavButton(
                text: 'Patterns 3',
                route: ('/2-algorithmic-drawing/patterns-3'),
              ),
              NavButton(
                text: 'Patterns 4',
                route: ('/2-algorithmic-drawing/patterns-4'),
              ),
              //
              NavHeader('Miscellaneous'),
              //
              NavButton(
                text: 'Simplex 3D Noise',
                route: '/misc/simplex-3d',
              ),
              NavButton(
                text: '"Creation" by Silexars',
                route: '/misc/creation',
              ),
              NavButton(
                text: '"Oblivion Radar" by ndel',
                route: '/misc/oblivion-radar',
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
