import 'package:flutter/material.dart';

class ContainerWithAnimation extends StatefulWidget {
  ContainerWithAnimation({Key? key}) : super(key: key);

  @override
  State<ContainerWithAnimation> createState() => _ContainerWithAnimationState();
}

class _ContainerWithAnimationState extends State<ContainerWithAnimation> {
  double sizeFactor = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        onEnd: () {
          setState(() {
            sizeFactor = 1;
          });
        },
        curve: Curves.linear,
        duration: Duration(milliseconds: 80),
        width: 300 * sizeFactor,
        height: 200 * sizeFactor,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () {
        setState(() {
          sizeFactor = 0.95;
        });
      },
      // onTapDown: (s) {
      //   setState(() {
      //     // sizeFactor = (sizeFactor == 1) ? 0.8 : 1;
      //     sizeFactor=0.8;
      //   });
      // },
      // onTapUp: (s) {
      //   setState(() {
      //     // sizeFactor = (sizeFactor == 1) ? 0.8 : 1;
      //     sizeFactor = 1;
      //   });
      // },
    );
  }
}
