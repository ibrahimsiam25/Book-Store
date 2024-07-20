import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/style.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BestSellersListViewItem extends StatelessWidget {
  const BestSellersListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetialsView,extra: bookModel);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .18,
        child: Row(
          children: [
           FeaturedListViewItem(imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const  Spacer(flex: 1,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child:  Text(bookModel.volumeInfo.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textStyleInter14 )),
                  Text(bookModel.volumeInfo.authors![0], style: Style.textStyleInterSecondry14),
                const  Spacer(flex: 3,),
                Row(
                    children: [
                      Text("Free",style:Style.textStyleInter14 ,),
                      Spacer(),
                     BookRating(rating:bookModel.volumeInfo.ratingsCount??0, count: bookModel.volumeInfo.ratingsCount??0,)
                    ],
                  ),
               const   Spacer(flex: 2,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
