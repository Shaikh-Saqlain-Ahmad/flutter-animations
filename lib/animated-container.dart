import 'package:flutter/material.dart';

class AnimationUsingContainer extends StatefulWidget {
  const AnimationUsingContainer({super.key});

  @override
  State<AnimationUsingContainer> createState() =>
      _AnimationUsingContainerState();
}

class _AnimationUsingContainerState extends State<AnimationUsingContainer> {
  var buttonTitle = "Zoom in";
  var isZoomedin = false;
  var _width = 60.0;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 370),
                width: _width,
                curve: _curve,
                child: Image.asset("assets/pic.jpg"),
              ),
              TextButton(
                  child: Text(buttonTitle),
                  onPressed: () {
                    setState(() {
                      isZoomedin = !isZoomedin;
                      buttonTitle = isZoomedin ? "Zoom out" : "Zoom in";
                      _width = isZoomedin ? 300 : 60;
                      _curve =
                          isZoomedin ? Curves.bounceInOut : Curves.bounceOut;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
