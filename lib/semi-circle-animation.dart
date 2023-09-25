import 'package:flutter/material.dart';
import 'package:flutter_animation/custom-clipper.dart';

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

class _SemiCircleState extends State<SemiCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
