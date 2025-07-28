
import 'package:Bookly/core/widgets/custom_error_widget.dart';
import 'package:Bookly/core/widgets/custom_loading_indicator.dart';
import 'package:Bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:Bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(builder: (context, state) {
      if (state is NewestBooksSuccessState){
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookModel: state.books[index],),
              );
            },
            childCount: state.books.length,
          ),
        );
      }
      else if (state is NewestBooksFailureState){
        return SliverToBoxAdapter(child: CustomErrorWidget(errorMessage: state.errorMessage));
      }
      return SliverToBoxAdapter(child: CustomLoadingIndicator());

    },);


  }
}
