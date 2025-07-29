import 'package:Bookly/core/widgets/custom_error_widget.dart';
import 'package:Bookly/core/widgets/custom_loading_indicator.dart';
import 'package:Bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:Bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksStates>(
      builder: (context, state) {
      if(state is SimilarBooksSuccessState){
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomBookImage(imageURL: state.books[index].volumeInfo!.imageLinks?.thumbnail??"",),
              );
            },
          ),
        );
      }
      else if(state is SimilarBooksFailureState){
        return CustomErrorWidget(errorMessage: state.errorMessage);
      }
      return Center(child: const CustomLoadingIndicator());

    },);

  }
}

