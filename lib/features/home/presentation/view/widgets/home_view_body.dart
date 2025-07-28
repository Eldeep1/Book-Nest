import 'package:Bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedBooksListView(),
              const SizedBox(height: 20),
              Text("Best Seller", style: Styles.textStyle18),
              const SizedBox(height: 20),
            ],
          ),
        ),
        BestSellerListView(),
      ],
    );
  }
}
