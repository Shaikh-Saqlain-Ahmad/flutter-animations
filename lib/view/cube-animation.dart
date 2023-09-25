import 'dart:math' show pi;
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' show Vector3;

class Cube extends StatefulWidget {
  const Cube({super.key});

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> with TickerProviderStateMixin {
  late AnimationController _xcontroller;
  late AnimationController _ycontroller;
  late AnimationController _zcontroller;
  late Tween<double>
      _animation; //no particular animation iss liye tween de dia wrna agr animation dete tou iske object ko ..animate lazmi dena parta
  double widthAndheight = 100;
  @override
  void initState() {
    super.initState();
    _xcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _ycontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _zcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  void dispose() {
    _xcontroller.dispose();
    _ycontroller.dispose();
    _zcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xcontroller
      ..reset()
      ..repeat();
    _ycontroller
      ..reset()
      ..repeat();
    _zcontroller
      ..reset()
      ..repeat();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: widthAndheight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation:
                  Listenable.merge([_xcontroller, _ycontroller, _zcontroller]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xcontroller))
                    ..rotateY(_animation.evaluate(_ycontroller))
                    ..rotateZ(_animation.evaluate(_zcontroller)),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.green,
                        height: widthAndheight,
                        width: widthAndheight,
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndheight)),
                        child: Container(
                          color: Colors.purple,
                          height: widthAndheight,
                          width: widthAndheight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2),
                        child: Container(
                          color: Colors.red,
                          height: widthAndheight,
                          width: widthAndheight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2),
                        child: Container(
                          color: Colors.blue,
                          height: widthAndheight,
                          width: widthAndheight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2),
                        child: Container(
                          color: Colors.orange,
                          height: widthAndheight,
                          width: widthAndheight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2),
                        child: Container(
                          color: Colors.brown,
                          height: widthAndheight,
                          width: widthAndheight,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
