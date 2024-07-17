

import 'package:bookly/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomNoResult extends StatelessWidget {
  const CustomNoResult({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text,style: Style.textStyle16,));
  }
}