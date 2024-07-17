import 'package:bookly/core/utlis/style.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_action.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';


class BoockDetailsSection extends StatelessWidget {
  const BoockDetailsSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [     Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.22),
            child:  FeaturedListViewItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??"",),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(bookModel.volumeInfo.title!,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: Style.textStyleInter14),
          const SizedBox(
            height: 6,
          ),
          Text(bookModel.volumeInfo.authors![0], style: Style.textStyleInterSecondry14),
          const SizedBox(
            height: 6,
          ),
           BookRating(
            
            mainAxisAlignment: MainAxisAlignment.center, rating: bookModel.volumeInfo.averageRating??0 , count: bookModel.volumeInfo.ratingsCount??0,
          ),
          const SizedBox(
            height: 10,
          ),
           BookActions(bookModel: bookModel,),
         const SizedBox(height: 15,),],
    );
  }
}
