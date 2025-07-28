import 'package:Bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});

  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text(
        //   "19.99\$",
        //   style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        // ),
        // Spacer(),
        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow,size: 14,),
        const SizedBox(width: 6.3),
        Text("$rating", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            "($count)",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
