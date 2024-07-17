import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Shimmer.fromColors(
    baseColor: secondryTextColor,
    highlightColor: primaryTextColor,
    child: Container(
      
      decoration:BoxDecoration(
        color: secondryTextColor,
        borderRadius: BorderRadius.circular(16)

      ) ,
    )
  ),
    );
  }
}
