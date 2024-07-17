import 'package:bookly/core/utlis/api_service.dart';
import 'package:bookly/features/home/date/repo/home_repo_implementation.dart';
import 'package:bookly/features/search/date/repo/search_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(getIt.get<ApiService>(),));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(apiService: getIt.get<ApiService>()));
}