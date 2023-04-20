import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final Function onPressed;
  const BouncingButton({super.key, required this.child, required this.onPressed});

  @override
  BouncingButtonState createState() => BouncingButtonState();
}

class BouncingButtonState extends State<BouncingButton> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  final duration = const Duration(milliseconds: 200);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
    Future.delayed(duration).then(
      (value) => widget.onPressed(),
    );
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
