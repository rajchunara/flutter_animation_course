import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 350);

final Container container = Container(
  width: 300,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.blue[300],
    borderRadius: BorderRadius.circular(10),
  ),
);

class AnimateOpacity extends StatefulWidget {
  AnimateOpacity({Key? key}) : super(key: key);

  @override
  State<AnimateOpacity> createState() => _AnimateOpacityState();
}

class _AnimateOpacityState extends State<AnimateOpacity> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.bounceInOut,
      child: GestureDetector(
        child: container,
        onTap: () {
          setState(() {
            opacity = (opacity == 1) ? 0.5 : 1;
          });
        },
      ),
      duration: duration,
      opacity: opacity,
    );
  }
}


