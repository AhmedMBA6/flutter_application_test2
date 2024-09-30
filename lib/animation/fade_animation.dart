import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FaddeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FaddeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween("opacity", Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500))
          .thenTween("Tran", Tween(begin: -30.0, end: 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
    return PlayAnimationBuilder(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (1000 * delay).round()),
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(offset: Offset(0, value.get("Tran")),child: child,),
      ),
      child: child,
    );
  }
}
