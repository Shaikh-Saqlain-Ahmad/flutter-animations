import 'package:flutter/material.dart';
import 'package:flutter_animation/custom-clipper.dart';
import 'dart:math' show pi;

class SemiCircle extends StatefulWidget {
  const SemiCircle({super.key});

  @override
  State<SemiCircle> createState() => _SemiCircleState();
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    late bool clockwise;
    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);
    path.close();
    return path;
  }
}

class _SemiCircleState extends State<SemiCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;
  @override
  void initState() {
    super.initState();
    _counterClockwiseRotationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _counterClockwiseRotationAnimation = Tween<double>(begin: 0, end: -(pi / 2))
        .animate(CurvedAnimation(
            parent: _counterClockwiseRotationController,
            curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    _counterClockwiseRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _counterClockwiseRotationController
        ..reset()
        ..forward();
    });
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _counterClockwiseRotationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: const HalfCircleClipper(side: CircleSide.left),
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ClipPath(
                    clipper: const HalfCircleClipper(side: CircleSide.right),
                    child: Container(
                      color: Colors.yellow,
                      width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
