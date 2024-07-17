import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/date/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
   NewestBooksCubit( this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
