import 'package:flutter/material.dart';

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
