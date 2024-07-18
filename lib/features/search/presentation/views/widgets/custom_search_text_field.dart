import 'package:bookly/constants.dart';
import 'package:bookly/features/search/presentation/manger/search_books/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value){
         BlocProvider.of<SearchBooksCubit>(context).fetchBooks(value);
      },
        onChanged: (value){
         BlocProvider.of<SearchBooksCubit>(context).fetchBooks(value);
      },
      style:const TextStyle(
        fontSize: 16.0, 
        color: secondryTextColor// Set the font size of the input text
      ),
      decoration: InputDecoration(
          enabledBorder: outLineInputBorder(),
          focusedBorder: outLineInputBorder(),
          contentPadding:const EdgeInsets.symmetric(
    vertical: 0.1, // Set the vertical padding
    horizontal: 12.0, // Set the horizontal padding
        ),
              hintText: 'search',
              hintStyle:const TextStyle(
                fontSize: 16.0,
                color: secondryTextColor
              ),
              suffixIcon:const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 17,
                color: secondryTextColor,
              )
              ),
            
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
            borderSide: const BorderSide(color: secondryTextColor
            ),
            borderRadius: BorderRadius.circular(12)
            );
  }
}
