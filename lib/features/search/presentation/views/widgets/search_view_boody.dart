import 'package:bookly/core/utlis/style.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_no_result.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_item_view_item.dart';
import 'package:bookly/features/search/presentation/manger/search_books/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBoody extends StatelessWidget {
  const SearchViewBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Search result',
                style: Style.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
        SliverToBoxAdapter(
          child: SerchLsitView()
        )
      ],
    );
  }
}

class SerchLsitView extends StatelessWidget {
  const SerchLsitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess){
          return  Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10) ,
            child: ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
            return Padding(
              padding:const EdgeInsets.only(top: 10),
              child: BestSellersListViewItem(bookModel: state.books[index],));
                    }),
          );
        }
      else   if (state  is SearchBooksFailure){
          return CustomErrorWidget(text: state.errMessage);
         }
          else if(state is SearchBooksLoading){
            return const CustomLoadingIndicator();
          }
         else{
          return const CustomNoResult(text: "search by book name");
         }
      },
    );
   
  }
}


