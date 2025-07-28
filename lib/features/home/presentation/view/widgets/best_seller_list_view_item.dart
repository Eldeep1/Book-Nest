import 'package:Bookly/core/utils/app_router.dart';
import 'package:Bookly/core/utils/styles.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 150,
            child: CustomBookImage(imageURL: bookModel.volumeInfo!.imageLinks!.thumbnail!),
          ),

          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    bookModel.volumeInfo!.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  bookModel.volumeInfo!.authors?.join(', ') ?? 'Unknown Author',
                  style: Styles.textStyle14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    // Rating was removed due to unavailability of from the API!
                    // BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
