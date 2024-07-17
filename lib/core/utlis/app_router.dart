import 'package:bookly/core/utlis/server_locator.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/date/repo/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manger/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/home/presentation/views/book_detials_view.dart';
import 'package:bookly/features/search/date/repo/search_repo_imp.dart';
import 'package:bookly/features/search/presentation/manger/search_books/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetialsView = '/booKDetialsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SpalshView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetialsView,
        builder: (context, state) =>  BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetialsView(bookModel:state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder:   (context, state) =>  BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImp>()),
          child: SearchView(),
        )
      ),
    ],
  );
}
