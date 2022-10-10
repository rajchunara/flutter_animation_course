import 'dart:async';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SimpleMultipleRingsAnimation extends StatefulWidget {
  int numOfRings;

  SimpleMultipleRingsAnimation({Key? key, required this.numOfRings})
      : super(key: key);

  @override
  State<SimpleMultipleRingsAnimation> createState() =>
      _SimpleMultipleRingsAnimationState();
}

class _SimpleMultipleRingsAnimationState
    extends State<SimpleMultipleRingsAnimation> {
  // late StreamController _streamController;
  // late Stream _stream;
  // late List<AnimationController> controllers;
  late List<AnimatedWaveNeumorphism> waves;

  // @override
  // void initState() {
  //   _streamController = StreamController();
  //   _stream = _streamController.stream;

  //   super.initState();
  // }

  List<AnimatedWaveNeumorphism> wavesGenerator() {
    List<AnimatedWaveNeumorphism> wavesList = [];
    int durationBetweenRingsInMilliseconds = 100;

    for (var i = 0; i < widget.numOfRings; i++) {
      wavesList.add(
        AnimatedWaveNeumorphism(
          durationBetweenRingsInMilliSeconds:
              durationBetweenRingsInMilliseconds +
                  (durationBetweenRingsInMilliseconds * i),
        ),
      );
    }

    return wavesList;
  }

  startAnimation() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        startAnimation();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF0F0F3),
        appBar: AppBar(
            title: Text("waves animation"), backgroundColor: Colors.black87),
        body: Center(
            child: Stack(
          children: [...wavesGenerator().reversed],
        )),
      ),
    );
  }
}

/*Animated Wave neumorphism */
class AnimatedWaveNeumorphism extends StatefulWidget {
  int durationBetweenRingsInMilliSeconds;
  int animationDurationInMilliSeconds;
  AnimatedWaveNeumorphism({
    Key? key,
    this.animationDurationInMilliSeconds = 1000,
    this.durationBetweenRingsInMilliSeconds = 0,
  }) : super(key: key);

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
      duration: Duration(milliseconds: widget.animationDurationInMilliSeconds),
    );

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _curveAnimation =
        CurveTween(curve: Curves.bounceInOut).animate(_opacityAnimation);

    // _opacityContoller =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    super.initState();
  }

  startAnimation() {
    // _animationController
    //     .forward()
    //     .then((value) => _animationController.reset());

    Future.delayed(
        Duration(milliseconds: widget.durationBetweenRingsInMilliSeconds), () {
      _animationController
          .forward()
          .then((value) => _animationController.reset());
    });
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

    WidgetsBinding.instance.addPostFrameCallback((_) => startAnimation());

    return Center(
      child: FadeTransition(
        opacity: _curveAnimation,
        child: ScaleTransition(
          scale: _animationController,
          child: Container(
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
