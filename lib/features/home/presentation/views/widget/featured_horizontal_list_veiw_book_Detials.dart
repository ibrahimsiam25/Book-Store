import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedHorizontalListViewBookDetails extends StatelessWidget {
  const FeaturedHorizontalListViewBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .18,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                if (state.books[index].volumeInfo.imageLinks == null ||
                    state.books[index].volumeInfo.title == null ||
                    state.books[index].volumeInfo.authors?[0] == null) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetialsView,
                            extra: state.books[index]);
                      },
                      child: FeaturedListViewItem(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks!.thumbnail,
                      ),
                    ),
                  );
                }
              }),
        );
      } else if (state is SimilarBooksFilaure) {
        return CustomErrorWidget(text: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
