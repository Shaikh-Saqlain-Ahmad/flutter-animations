import 'package:flutter/material.dart';
import 'package:flutter_animation/class/polygon-class.dart';

class MutliShape extends StatefulWidget {
  const MutliShape({super.key});

  @override
  State<MutliShape> createState() => _MutliShapeState();
}

class _MutliShapeState extends State<MutliShape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
            painter: PolygonPainter(sides: 3),
            child: SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
            )),
      ),
    );
  }
}
