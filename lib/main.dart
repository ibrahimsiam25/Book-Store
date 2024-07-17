import 'package:bookly/constants.dart';
import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/server_locator.dart';
import 'package:bookly/features/home/date/repo/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/search/date/repo/search_repo_imp.dart';
import 'package:bookly/features/search/presentation/manger/search_books/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
    setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImplementation>())..fetchNewsetBooks(),
        ),
      
      ],
      child:MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: backGroundColor,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    )
    );
  }
}
