import 'package:flutter/material.dart';

class SequenceAnimationOfContainer extends StatefulWidget {
  SequenceAnimationOfContainer({Key? key}) : super(key: key);

  @override
  State<SequenceAnimationOfContainer> createState() =>
      _SequenceAnimationOfContainerState();
}

class _SequenceAnimationOfContainerState
    extends State<SequenceAnimationOfContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _size;
  late Animation<Color?> _color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _size = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.5, curve: Curves.bounceInOut)));

    _color = ColorTween(begin: Colors.amber[300], end: Colors.red[400]).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOut)));
  }

  onTap() {
    // _controller.forward().then((value) => _controller.reverse()).then((value) => _controller.repeat(reverse: true));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _child) {
          return Center(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                  width: 200 * _size.value,
                  height: 200 * _size.value,
                  color: _color.value),
            ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
