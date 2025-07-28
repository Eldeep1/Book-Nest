import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomBookImage(imageURL: "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/144694078/original/42073354247a976027d92a56ded126bc59235d60/send-you-a-random-png.png",),
          );
        },
      ),
    );
  }
}

