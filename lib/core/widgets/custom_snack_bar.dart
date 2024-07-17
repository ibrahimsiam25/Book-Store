import 'package:bookly/constants.dart';
import 'package:bookly/core/utlis/style.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: Style.textStyle16,),
      backgroundColor: secondryTextColor,
      
    ),
  );
}