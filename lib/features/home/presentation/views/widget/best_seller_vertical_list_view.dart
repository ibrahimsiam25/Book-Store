import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_item_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerVerticalListView extends StatelessWidget {
  const BestSellerVerticalListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:const  EdgeInsets.symmetric(vertical: 5),
                    child: BestSellersListViewItem(bookModel: state.books[index],),
                  );
                }),
          );
        }
       else if (state is NewestBooksFailure){
        return CustomErrorWidget(text: state.errMessage);
       }
       else {
        return const CustomLoadingIndicator();
       }
      },
    );
  }
}
