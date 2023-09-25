import 'package:flutter/material.dart';
import 'package:flutter_animation/class/person-class.dart';
import 'package:flutter_animation/hero-animation.dart';

class Details extends StatelessWidget {
  final Person person;
  const Details({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Hero(
              flightShuttleBuilder: ((flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: toHeroContext.widget,
                    );
                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                          scale: animation.drive(Tween<double>(
                                  begin: 0.0, end: 1.0)
                              .chain(CurveTween(curve: Curves.fastOutSlowIn))),
                          child: fromHeroContext.widget),
                    );
                }
              }),
              tag: person.name,
              child: Text(
                person.emoji,
                style: TextStyle(fontSize: 30),
              )),
        ),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 30),
          Text(
            person.name,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          Text(
            "${person.age}",
            style: TextStyle(fontSize: 30),
          )
        ]),
      ),
    );
  }
}
