
import 'package:Bookly/core/functions/launch_url.dart';
import 'package:Bookly/core/widgets/custom_button.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {

            },
            text: "Free",
            backGroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              await launchCustomUrl(context, url: bookModel.volumeInfo!.previewLink??"");
            },

            fontSize: 16,
            text:  getText(bookModel),
            backGroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo!.previewLink==null){
      return 'Not Available';
    }
    return 'Preview';
  }
}
