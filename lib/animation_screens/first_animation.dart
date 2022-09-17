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
        curve: Curves.elasticInOut,
        duration: Duration(milliseconds: 350),
        width: 300 * sizeFactor,
        height: 200 * sizeFactor,
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(10)),
      ),
      onTap: () {
        setState(() {
          sizeFactor = (sizeFactor == 1) ? 0.8 : 1;
        });
      },
    );
  }
}
