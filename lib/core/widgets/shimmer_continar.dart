import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContinar extends StatelessWidget {
  const ShimmerContinar({super.key});

  @override
  Widget build(context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: secondryTextColor,
          highlightColor: primaryTextColor,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: secondryTextColor,
                borderRadius: BorderRadius.circular(16)),
          )),
    );
  }
}
