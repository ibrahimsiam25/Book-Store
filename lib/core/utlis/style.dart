import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';



abstract class Style {
  static const TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );
  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );
    static const TextStyle textStyleInter14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
      fontFamily: _fontFamily,
  );
      static const TextStyle textStyleInterSecondry14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: secondryTextColor,
      fontFamily: _fontFamily,
  );
  static const String _fontFamily = 'Inter';

}

