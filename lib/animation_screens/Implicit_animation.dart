import 'dart:math';

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

/* 
Align -> AnimateAlign
Container -> AnimatedContainer
DefaultTextStyle -> AnimatedDefaultTextStyle
Opacity -> AnimatedOpacity
Padding -> AnimatedPadding
PhysicalModel -> AnimatedPhysicalModel
Positioned -> AnimatedPositioned
PositionDirectional -> AnimatedPositionedDirectional
Theme -> AnimatedThemeSize -> AnimatedSize
 */

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

class AlignAnimate extends StatefulWidget {
  AlignAnimate({Key? key}) : super(key: key);

  @override
  State<AlignAnimate> createState() => _AlignAnimateState();
}

class _AlignAnimateState extends State<AlignAnimate> {
  List<Alignment> listAlignment = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight
  ];
  Alignment alignment = Alignment.bottomRight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Random random = Random();
        setState(() {
          /* Generate random alignment */
          alignment = listAlignment[random.nextInt(9)];
        });
      },
      child: AnimatedAlign(
        child: container,
        duration: duration,
        alignment: alignment,
      ),
    );
  }
}
