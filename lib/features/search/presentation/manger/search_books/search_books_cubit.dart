import 'package:bloc/bloc.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/search/date/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;
   Future<void> fetchBooks(String textSearch) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchBooks(textSearch: textSearch);
    result.fold((failure) {
         if(failure.errMessage=="type 'Null' is not a subtype of type 'Iterable<dynamic>'"){
         emit(SearchBooksFailure("no books found"));
      }
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
