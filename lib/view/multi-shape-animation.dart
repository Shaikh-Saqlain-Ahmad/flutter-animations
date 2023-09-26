import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/class/polygon-class.dart';

class MutliShape extends StatefulWidget {
  const MutliShape({super.key});

  @override
  State<MutliShape> createState() => _MutliShapeState();
}

class _MutliShapeState extends State<MutliShape> with TickerProviderStateMixin {
  late AnimationController _sideController;
  late Animation<int> _sideAnimation;
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();
    _sideController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _sideAnimation = IntTween(begin: 3, end: 10).animate(_sideController);
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _sizeAnimation = Tween(begin: 20.0, end: 400.0)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_sizeController);
    _rotationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _rotationAnimation = Tween(begin: 0.0, end: 2 * pi)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_rotationController);
  }

  @override
  void dispose() {
    _sideController.dispose();
    _sideController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sideController.repeat(reverse: true);
    _sizeController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [_sideController, _sizeController, _rotationController]),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_rotationAnimation.value)
                ..rotateY(_rotationAnimation.value)
                ..rotateZ(_rotationAnimation.value),
              child: CustomPaint(
                  painter: PolygonPainter(sides: _sideAnimation.value),
                  child: SizedBox(
                    height: _sizeAnimation.value,
                    width: _sizeAnimation.value,
                  )),
            );
          },
        ),
      ),
    );
  }
}
