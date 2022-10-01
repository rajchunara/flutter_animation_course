import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

/*Animated Wave neumorphism */
class AnimatedWaveNeumorphism extends StatefulWidget {
  const AnimatedWaveNeumorphism({Key? key}) : super(key: key);

  @override
  State<AnimatedWaveNeumorphism> createState() =>
      _AnimatedWaveNeumorphismState();
}

class _AnimatedWaveNeumorphismState extends State<AnimatedWaveNeumorphism>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      // lowerBound: 1.0,
      // upperBound: 0.0,
      duration: Duration(milliseconds: 1000),
    );

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _curveAnimation =
        CurveTween(curve: Curves.bounceInOut).animate(_opacityAnimation);

    // _opacityContoller =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    super.initState();
  }

  onTap() {
    _animationController
        .forward()
        .then((value) => _animationController.reset());
  }

  @override
  Widget build(BuildContext context) {
    const Color boxDarkShadow = Color.fromARGB(166, 209, 209, 209);
    // const Color boxColor = Color.fromARGB(255, 221, 233, 255);
    const Color boxColor = Color(0xFFF0F0F3);
    const Color boxLightShadow = Color.fromARGB(255, 255, 255, 255);
    const Offset offset = Offset(5, 5);
    const Offset minusOffset = Offset(-5, -5);
    const double spreadRadius = -3;
    const double blurRadius = 6;

    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        backgroundColor: boxColor,
        body: Center(
          child: FadeTransition(
            opacity: _curveAnimation,
            child: ScaleTransition(
              scale: _animationController,
              child: Container(
                child: const Center(
                  child: Text(
                    'Wave',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    /* Outer Shadow */
                    BoxShadow(
                      color: boxDarkShadow,
                      spreadRadius: spreadRadius,
                      blurRadius: blurRadius,
                      offset: offset,
                    ),
                    BoxShadow(
                      color: boxLightShadow,
                      spreadRadius: spreadRadius,
                      blurRadius: blurRadius,
                      offset: minusOffset,
                    ),
                    /* Inner Shadow */
                    /* right bottom light shadow */
                    BoxShadow(
                      color: boxLightShadow,
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: minusOffset,
                      inset: true,
                    ),
                    /* right bottom dark shadow */
                    BoxShadow(
                      color: boxDarkShadow.withOpacity(0.8),
                      spreadRadius: spreadRadius,
                      blurRadius: blurRadius,
                      offset: minusOffset,
                      inset: true,
                    ),
                    /* top left dark shadow */
                    BoxShadow(
                      color: boxDarkShadow.withOpacity(0.9),
                      spreadRadius: -1,
                      blurRadius: 15,
                      offset: offset,
                      inset: true,
                    ),
                    /* top left light shadow */
                    BoxShadow(
                      color: boxLightShadow,
                      spreadRadius: spreadRadius,
                      blurRadius: blurRadius,
                      offset: offset,
                      inset: true,
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: boxColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
