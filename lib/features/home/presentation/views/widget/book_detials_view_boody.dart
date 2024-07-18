import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_detials_section.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_detials_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widget/horizontal_list_view_book_detials_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBoody extends StatelessWidget {
  const BookDetialsViewBoody({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  children: [
                  const  CustomBookDetialsAppBar(),
                    BoockDetailsSection(bookModel: bookModel,),
                 const   Expanded(child: SizedBox(height: 5,)),
                 const   HorizontalLisatViewBookDetialsSection(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
