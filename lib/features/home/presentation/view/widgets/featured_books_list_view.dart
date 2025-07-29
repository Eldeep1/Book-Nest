import 'package:Bookly/core/widgets/custom_error_widget.dart';
import 'package:Bookly/core/widgets/custom_loading_indicator.dart';
import 'package:Bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:Bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksStates>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccessState){
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomBookImage(imageURL: state.books[index].volumeInfo!.imageLinks?.thumbnail??"",),
                );
              },
            ),
          );
        }
         if(state is FeaturedBooksFailureState){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
         return Center(child: const CustomLoadingIndicator());
      },
    );
  }
}
