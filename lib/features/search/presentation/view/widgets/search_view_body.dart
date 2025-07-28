import 'package:Bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(),
        SizedBox(height: 16),
        Text("Search Results", style: Styles.textStyle18),
        SizedBox(height: 16),
        Expanded(child: SearchResultsListView()),
      ],
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // child: BestSellerListViewItem(),
        );
      },
      itemCount: 50,
    );
  }
}
