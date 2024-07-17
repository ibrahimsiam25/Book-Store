import 'package:bookly/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class SidingImage extends StatelessWidget {
  const SidingImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
              position: slidingAnimation,
              child: Image.asset(AssetsData.bookStore));
        });
  }
}
