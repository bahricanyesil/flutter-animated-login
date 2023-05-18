import 'package:flutter/material.dart';

/// Helper class for animations.
class AnimationHelper {
  /// * Creates tween sequence animation, [tweenSequenceAnimation].
  const AnimationHelper({
    required this.animationController,
    required this.animationCurve,
  });

  /// Animation controller.
  final AnimationController animationController;

  /// Curve of the animation.
  final Curve animationCurve;

  /// Tween sequence animation.
  Animation<double> tweenSequenceAnimation(double num, double weight) =>
      TweenSequence<double>(
        <TweenSequenceItem<double>>[
          _tweenSequenceItem(end: num),
          _tweenSequenceItem(begin: num, end: num, weight: weight),
          _tweenSequenceItem(begin: -num),
        ],
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: animationCurve,
        ),
      );

  static TweenSequenceItem<double> _tweenSequenceItem({
    double begin = 0,
    double end = 0,
    double weight = 30,
  }) =>
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: begin, end: end),
        weight: weight,
      );
}
