import 'package:Bookly/core/utils/styles.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:Bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomAppBarBookDetails(),

                BookDetailsSection(bookModel: bookModel,),
                const SizedBox(height: 50),
                SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(imageURL: bookModel.volumeInfo!.imageLinks?.thumbnail??"",),
        ),

        const SizedBox(height: 43),
        Text("${bookModel.volumeInfo!.title}", style: Styles.textStyle30,textAlign: TextAlign.center,),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo!.authors?.join(', ') ?? 'Unknown Author',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        // adding custom values, can't add real values because there's no values getting returned by the API
        const BookRating(
          count: 10,
          rating: 2.2,
        ),
        const SizedBox(height: 37),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}


class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also like",style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600,),),
        const SizedBox(height: 16),
        const SimilarBooksListView(),
      ],
    );
  }
}
