import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manger/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/book_detials_view_boody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetialsView extends StatefulWidget {
  const BookDetialsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetialsView> createState() => _BookDetialsViewState();
}

class _BookDetialsViewState extends State<BookDetialsView> {
  @override
  void initState() {
    //triger my function when use book detials  only 
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(widget.bookModel.volumeInfo.categories?[0]??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BookDetialsViewBoody( bookModel: widget.bookModel,) ,
    );
  }
}

