import 'package:flutter/material.dart';
import 'package:flutter_animation/animated-container.dart';

import 'package:flutter_animation/hero-animation.dart';
import 'package:flutter_animation/view/animated-drawer.dart';
import 'package:flutter_animation/view/animated-prompt.dart';
import 'package:flutter_animation/view/color-animation.dart';
import 'package:flutter_animation/view/multi-shape-animation.dart';

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
      title: '',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          colorScheme: ColorScheme.dark()),
      home: Caller(),
    );
  }
}
