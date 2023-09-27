import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedPrompt extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget child;
  const MyAnimatedPrompt(
      {super.key,
      required this.title,
      required this.subTitle,
      required,
      required this.child});

  @override
  State<MyAnimatedPrompt> createState() => _MyAnimatedPromptState();
}

class _MyAnimatedPromptState extends State<MyAnimatedPrompt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _containerScaleAnimation;
  late Animation<Offset> _ydisplacementAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _ydisplacementAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.23),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _iconScaleAnimation = Tween<double>(begin: 7, end: 6)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _containerScaleAnimation = Tween<double>(
      begin: 2.0,
      end: 0.4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), //same
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), //same
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 100,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    widget.subTitle,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned.fill(
                child: SlideTransition(
              position: _ydisplacementAnimation,
              child: ScaleTransition(
                  scale: _containerScaleAnimation,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: ScaleTransition(
                        scale: _iconScaleAnimation, child: widget.child),
                  )),
            ))
          ]),
        ),
      ),
    );
  }
}

class Caller extends StatelessWidget {
  const Caller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Icons")),
      body: Center(
          child: MyAnimatedPrompt(
        child: Icon(Icons.check),
        title: "Thank you for order",
        subTitle: "Your order will be delivered in two days",
      )),
    );
  }
}
