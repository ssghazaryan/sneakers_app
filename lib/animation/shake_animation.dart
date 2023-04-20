import 'package:flutter/material.dart';
import 'package:sneakers_test_app/animation/rotation.dart';
import 'package:sneakers_test_app/animation/tween_sequence.dart';

class ShakeAnimatedWidget extends StatefulWidget {
  final Duration duration;
  final Rotation shakeAngle;
  final bool enabled;
  final Widget child;
  final Curve curve;
  final Alignment alignment;

  /// A shake animation
  ///
  /// duration : the duration of the animation, including intermediate values
  /// enabled : determine if the animation is stopped or fired
  /// curve : An easing curve, see [Curve]
  /// alignment : The center of the shake
  ///
  /// shakeAngle : oscilate between 0, -shakeAngle, 0, shakeAngle, 0
  ///   - can be in radians or degrees (see [Rotation])
  ///
  /// animationFinished : a callback called when the animation is finished
  const ShakeAnimatedWidget({
    super.key,
    this.duration = const Duration(milliseconds: 300),
    this.shakeAngle = const Rotation.radians(z: 0.015),
    this.curve = Curves.linear,
    this.enabled = true,
    this.alignment = Alignment.center,
    required this.child,
  });

  @override
  createState() => _State();

  //except the boolean `enabled`
  bool isAnimationEqual(ShakeAnimatedWidget other) =>
      shakeAngle == other.shakeAngle && duration == other.duration && curve == other.curve;
}

class _State extends State<ShakeAnimatedWidget> with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _rotationYAnim;

  @override
  void didUpdateWidget(ShakeAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimationEqual(oldWidget)) {
      if (widget.enabled != oldWidget.enabled) {
        _updateAnimationState();
      }
    } else {
      _createAnimations();
      _updateAnimationState();
    }
  }

  void _updateAnimationState() async {
    if (widget.enabled) {
      _animationController!.forward();
    } else {
      _animationController!.reset();
    }
  }

  void _createAnimations() {
    _animationController?.stop();
    _animationController?.dispose();
    _animationController = AnimationController(duration: widget.duration, vsync: this);

    _rotationYAnim = chainTweens([0.0, widget.shakeAngle.y, 0.0]).animate(
      CurvedAnimation(parent: _animationController!, curve: widget.curve),
    ) as Animation<double>
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void initState() {
    _createAnimations();
    _updateAnimationState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: widget.alignment,
      transform: Matrix4.identity()..rotateY(_rotationYAnim.value),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
