import 'package:flutter/material.dart';
import 'package:flutter_animation/view/cube-animation.dart';
import 'package:flutter_animation/hero-animation.dart';
import 'package:flutter_animation/semi-circle-animation.dart';
import 'package:flutter_animation/simple-animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HeroAnimation(),
    );
  }
}
