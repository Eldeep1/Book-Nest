import 'package:Bookly/core/utils/styles.dart';
import 'package:Bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:Bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

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

                BookDetailsSection(),
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
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(imageURL: "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/144694078/original/42073354247a976027d92a56ded126bc59235d60/send-you-a-random-png.png",),
        ),

        const SizedBox(height: 43),
        Text("The Jungle Book", style: Styles.textStyle30),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        // Rating was removed due to unavailability of from the API!
        // const BookRating(),
        const SizedBox(height: 37),
        const BooksAction(),
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
