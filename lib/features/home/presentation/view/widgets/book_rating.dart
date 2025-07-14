import 'package:Bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "19.99\$",
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow),
        const SizedBox(width: 6.3),
        Text("4.8", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          "(2390)",
          style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
        ),
      ],
    );
  }
}
