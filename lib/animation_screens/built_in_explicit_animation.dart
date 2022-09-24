import 'package:flutter/material.dart';
import 'package:flutter_animation_course/animation_screens/implicit_animation.dart';

/* 

List of Transition widget used for built in explicit animation

-SizeTransition
-FadeTransition
-AlignTransition
-ScaleTransition
-SlideTransition
-RotationTransition
-PositionedTransition
-DecorationBoxTransition
-DefaultTextStyleTransition
-RelativePositionTransition

This above transition widgets extends AnimatedWidget


 */

class ExplicitBuiltInRotation extends StatefulWidget {
  ExplicitBuiltInRotation({Key? key}) : super(key: key);

  @override
  State<ExplicitBuiltInRotation> createState() =>
      _ExplicitBuiltInRotationState();
}

class _ExplicitBuiltInRotationState extends State<ExplicitBuiltInRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      alignment: Alignment.center,
      child: container,
    );
  }
}
