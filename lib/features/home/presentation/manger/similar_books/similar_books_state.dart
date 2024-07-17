part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksFilaure extends SimilarBooksState {
  final String errMessage;

 const SimilarBooksFilaure( this.errMessage);
}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

 const SimilarBooksSuccess({required this.books});

}
