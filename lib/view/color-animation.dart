import 'package:flutter/material.dart';

import '../class/circle-clipper.dart';
import 'dart:math' as math;

class ColorAnimation extends StatefulWidget {
  const ColorAnimation({super.key});

  @override
  State<ColorAnimation> createState() => _ColorAnimationState();
}

Color getColor() => Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));

class _ColorAnimationState extends State<ColorAnimation> {
  var _color = getColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: getColor(), end: _color),
            onEnd: () {
              setState(() {
                _color = getColor();
              });
            },
            duration: Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.red),
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
