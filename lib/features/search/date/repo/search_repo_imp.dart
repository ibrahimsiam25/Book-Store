import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utlis/api_service.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/search/date/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo{
  final ApiService apiService;

  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchBooks({required String textSearch}) async{
     try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=$textSearch');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
 
  }
  }
  
