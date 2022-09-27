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
  bool darkMode = false;

  @override
  void initState() {
    /* In AnimationController we get range of values from 0 to 1 */
    _animationController = AnimationController(vsync: this, duration: duration);
    /* By using tween, we can get range of one color to another and animationController gives control of animation*/
    _colorAnimation = ColorTween(begin: Colors.amber, end: Colors.black87)
        .animate(_animationController);
    // _animationController.forward();

    /* addListener listens to the change in value when forward() is triggered for animation */
    _animationController.addListener(() {
      // print(_animationController.value);
      // print(_colorAnimation.value);

      /* setState to animate(change position or color) on every value change */
      /* instead of using setState we can also use AnimationBuilder() */
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        !darkMode
            ? _animationController.forward()
            : _animationController.reverse();

        darkMode = !darkMode;
        print(darkMode);
      }),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _colorAnimation.value),
      ),
    );
  }
}

//Todo: Explicit animations using Animation Builder

class ExplicitWithAnimationBuilder extends StatefulWidget {
  ExplicitWithAnimationBuilder({Key? key}) : super(key: key);

  @override
  State<ExplicitWithAnimationBuilder> createState() =>
      _ExplicitWithAnimationBuilderState();
}

class _ExplicitWithAnimationBuilderState
    extends State<ExplicitWithAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation _textColorAnimation;
  bool darkMode = false;

  @override
  void initState() {
    /* In AnimationController we get range of values from 0 to 1 */
    _animationController = AnimationController(vsync: this, duration: duration);
    /* By using tween, we can get range of one color to another and animationController gives control of animation*/
    _colorAnimation = ColorTween(begin: Colors.amber, end: Colors.black87)
        .animate(_animationController);
    _textColorAnimation = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(_animationController);

    // _animationController.forward();

    /* addListener listens to the change in value when forward() is triggered for animation */
    // _animationController.addListener(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return GestureDetector(
          onTap: (() {
            !darkMode
                ? _animationController.forward()
                : _animationController.reverse();

            darkMode = !darkMode;
          }),
          child: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _colorAnimation.value),
            child: const Center(
                child: Text(
              'Explicit Animation Builder',
              // style: TextStyle(color: _textColorAnimation.value),
            )),
          ),
        );
      },
    );
  }
}
