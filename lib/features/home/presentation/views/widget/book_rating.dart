import 'package:bookly/constants.dart';
import 'package:bookly/core/utlis/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment =MainAxisAlignment.start, required this.rating, required this.count});
   final MainAxisAlignment mainAxisAlignment;
   final num rating;
   final int count;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
       const Icon(
          FontAwesomeIcons.solidStar,
          color: brownColor,
          size: 13,
        ),
       const SizedBox(width: 6.3,),
        Text('$rating',style: Style.textStyleInter14,),
     const SizedBox(width: 5,),
        Text("($count)",style: Style.textStyleInter14,)
      ],
    );
  }
}