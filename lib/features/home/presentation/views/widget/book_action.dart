import 'package:bookly/constants.dart';
import 'package:bookly/core/function/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
               onPressed: () async {
          launchCustomUr(context,bookModel.volumeInfo.previewLink!);
          },
          backGroundColor: primaryTextColor,
          textColor: backGroundColor,
          text: "Free",
          fontSize: 15,
        )),
    const    SizedBox(
          width: 16,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () async {
          launchCustomUr(context,bookModel.volumeInfo.previewLink!);
          },
          backGroundColor: backGroundColor,
          textColor: primaryTextColor,
          fontSize: 15,
          borderSideColor: primaryTextColor,
          text: 'Preview',
        ))
      ],
    );
  }
}
