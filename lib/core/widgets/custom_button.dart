import 'package:bookly/core/utlis/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.textColor,
       this.borderRadius, this.borderSideColor, required this.text, this.fontSize, this.onPressed});
  final Color backGroundColor;
  final Color textColor;
  final String text;
  final double? fontSize;
  final Color? borderSideColor;
  final BorderRadius ? borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed ,
        style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
                borderRadius:borderRadius ??BorderRadius.circular(12),
                 side: BorderSide(
                color:borderSideColor??backGroundColor,
                width: 1.0,
              ),)),
        child: Text(
          text,
          style: Style.textStyle14.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: fontSize,
          ),
        ));
  }
}
