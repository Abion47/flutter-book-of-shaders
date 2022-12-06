import 'package:flutter/material.dart';

abstract class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  int get frameSampleCount => 10;

  Widget buildPage(BuildContext context, double time, double deltaTime);

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _start = 0;
  double _time = 0;
  double _deltaTime = 0;

  late List<double> _frameTimes;
  int _frameIdx = 0;

  @override
  void initState() {
    _start = DateTime.now().millisecondsSinceEpoch / 1000;
    _frameTimes = List.filled(widget.frameSampleCount, 0);
    super.initState();
  }

  void onFrame() {
    final frame = DateTime.now().millisecondsSinceEpoch / 1000;
    final lastTime = _time;
    _time = frame - _start;

    _deltaTime = _time - lastTime;
    _frameTimes[_frameIdx] = _time - lastTime;
    _frameIdx = (_frameIdx + 1) % widget.frameSampleCount;

    Future.microtask(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    onFrame();
    final avgMs = _frameTimes.reduce((sum, time) => sum + time) /
        _frameTimes.length *
        1000;

    final child = widget.buildPage(context, _time, _deltaTime);
    return Scaffold(
      appBar: AppBar(),
      body: Banner(
        message: '${avgMs.toStringAsFixed(1)}ms',
        location: BannerLocation.topStart,
        child: child,
      ),
    );
  }
}
