import 'package:flutter/material.dart';
import 'package:flutter_animation_course/animation_screens/implicit_animation.dart';

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
