import 'package:Bookly/core/utils/app_router.dart';
import 'package:Bookly/core/utils/assets.dart';
import 'package:Bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kBookDetailsView);
          },
          child: SizedBox(
            height: 150,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.test_image),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 30,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width* .5,
                child: Text(
                  "Harry Potter and the goblet of fire",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Styles.textStyle20,
                ),
              ),
              const SizedBox(height: 3,),
              Text("J.K Rowling",style: Styles.textStyle14,),
              const SizedBox(height: 3,),
              BookRating(),
            ],
          ),
        ),
      ],
    );
  }
}
