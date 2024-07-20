import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookHorizontalListView extends StatelessWidget {
  const FeaturedBookHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (state.books[index].volumeInfo.imageLinks == null) {
                    return Container();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                                AppRouter.kBookDetialsView,
                                extra: state.books[index]);
                          },
                          child: FeaturedListViewItem(
                              imageUrl: state.books[index].volumeInfo
                                  .imageLinks!.thumbnail)),
                    );
                  }
                }),
          );
        }
        if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
