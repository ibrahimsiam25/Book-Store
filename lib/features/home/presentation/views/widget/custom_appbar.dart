import 'package:bookly/constants.dart';
import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/assets.dart';
import 'package:bookly/features/search/presentation/manger/search_books/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            width:50,
            height: 50,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 30,
                color: secondryTextColor,
              ))
        ],
      ),
    );
  }
}
