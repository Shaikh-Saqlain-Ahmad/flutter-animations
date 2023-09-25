import 'package:flutter/material.dart';
import 'package:flutter_animation/class/person-class.dart';
import 'package:flutter_animation/view/details-screen.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("People"))),
        body: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Details(person: person)));
                },
                leading: Hero(
                  tag: person.name,
                  child: Text(
                    person.emoji,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                title: Text(person.name),
                subtitle: Text("${person.age} years old"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              );
            }));
  }
}
