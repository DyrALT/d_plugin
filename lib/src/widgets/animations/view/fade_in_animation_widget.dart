import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

/// The code defines a `FadeAnimation` class that extends `StatelessWidget`. It is used to create a fade
/// animation effect on a child widget.
@immutable
final class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        AniProps.opacity,
        Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        AniProps.translateY,
        Tween<double>(begin: -30, end: 0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      delay: duration,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (_, Movie value, Widget? child) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}
