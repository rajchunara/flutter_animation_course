import 'package:flutter/material.dart';
import 'package:flutter_animation_course/animation_screens/implicit_animation.dart';
import 'dart:math' as math;

/* Tween Animation is mainly used 
were animation is triggered when widget is loaded

 */

class TweenAnime extends StatefulWidget {
  TweenAnime({Key? key}) : super(key: key);

  @override
  State<TweenAnime> createState() => _TweenAnimeState();
}

class _TweenAnimeState extends State<TweenAnime> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: Colors.red, end: Colors.green),
        duration: const Duration(milliseconds: 350),
        builder: (BuildContext context, Color? color, Widget? child) {
          return Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }
}

class TweenOpacityPadding extends StatelessWidget {
  TweenOpacityPadding({Key? key}) : super(key: key);

  var duration = Duration(milliseconds: 350);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        curve: Curves.easeIn,
        child: Text(
          'Top Down Animation',
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        /* Here we can add input value of slider or any other input
        to end of tween and when input value changes the end value of tween changes
         */
        tween: Tween<double>(begin: 0, end: 1),
        duration: duration,
        builder: (_, double val, Widget? child) {
          return Opacity(
            opacity: val,
            child: Padding(
              padding: EdgeInsets.only(top: val * 50),
              child: child,
            ),
          );
        });
  }
}

class TweenRandomColor extends StatefulWidget {
  TweenRandomColor({Key? key}) : super(key: key);

  @override
  State<TweenRandomColor> createState() => _TweenRandomColorState();
}

class _TweenRandomColorState extends State<TweenRandomColor> {
  Color endColor = Colors.green;

  void changeColor() {
    setState(() {
      endColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.red, end: endColor),
            duration: const Duration(milliseconds: 350),
            builder: (BuildContext context, Color? color, Widget? child) {
              return Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black54)),
            onPressed: () {
              changeColor();
            },
            child: Text('Change Color'))
      ],
    );
  }
}
