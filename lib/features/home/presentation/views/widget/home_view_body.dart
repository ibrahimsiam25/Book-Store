import 'package:bookly/core/utlis/style.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_vertical_list_view.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_book_horizontal_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'For you',
                  style: Style.textStyle16,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              FeaturedBookHorizontalListView(),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Text(
                  'Newset Books',
                  style: Style.textStyle16,
                ),
              ),
             
            ],
          ),
        ),
        SliverToBoxAdapter(
          child:    BestSellerVerticalListView(),
        )
        ],
      ),
    );
    
  }
}








