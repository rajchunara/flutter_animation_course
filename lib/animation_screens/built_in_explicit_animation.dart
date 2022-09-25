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

Explicit animations give better control over animations - like forward, stop, do something when animation complets etc

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
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      alignment: Alignment.center,
      child: GestureDetector(
        child: container,
        onTap: () {
          _animationController.isAnimating
              ? _animationController.stop()
              : {
                  _animationController
                      .forward()
                      .whenComplete(() => _animationController.repeat())
                };
        },
      ),
    );
  }
}

class ExplicitColorAndScaleAnimation extends StatefulWidget {
  ExplicitColorAndScaleAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitColorAndScaleAnimation> createState() =>
      _ExplicitColorAndScaleAnimationState();
}

class _ExplicitColorAndScaleAnimationState
    extends State<ExplicitColorAndScaleAnimation>
    with TickerProviderStateMixin {
  /* 
      Animation Controller gives value between 0 and 1
      but we can add lowerbound and upperbound to change that
       */
  late AnimationController _animationController;
  /* We could have used above animation controller but value given by that controller is different */
  late AnimationController _colorAnimationController;
  late Animation _borderColorAnimation;
  bool _active = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: duration, lowerBound: 1.0, upperBound: 1.1);

    /* Use ColorTween for color animation */
    /* Add listener to animation to change color using setState when controller changes value */
    _colorAnimationController =
        AnimationController(vsync: this, duration: duration);
    _borderColorAnimation =
        ColorTween(begin: Colors.black12, end: Colors.redAccent)
            .animate(_colorAnimationController)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  onTap() {
    _animationController.forward().then((value) {
      _active
          ? _colorAnimationController.forward()
          : _colorAnimationController.reverse();

      _animationController.reverse();
    });
    _active = !_active;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ScaleTransition(
        scale: _animationController,
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(
              width: 5.0,
              color: _borderColorAnimation.value,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
