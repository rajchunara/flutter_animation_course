import 'package:flutter/material.dart';
import 'package:flutter_animation_course/animation_screens/implicit_animation.dart';

class ExplicitAnimations extends StatefulWidget {
  ExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;

  @override
  void initState() {
    /* In AnimationController we get range of values from 0 to 1 */
    _animationController = AnimationController(vsync: this, duration: duration);
    /* By using tween, we can get range of one color to another and animationController gives control of animation*/
    _colorAnimation = ColorTween(begin: Colors.amber, end: Colors.purpleAccent)
        .animate(_animationController);
    _animationController.forward();

    /* addListener listens to the change in value when forward() is triggered for animation */
    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
