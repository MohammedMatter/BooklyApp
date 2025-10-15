import 'dart:developer';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  BookRating({super.key, required this.widget, this.rating  ,required this.book});
  double? rating;
  final HomePageBody widget;
BookModel book  ; 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber),

        Text('${rating ?? '-'}', style: Styles.textStyle16),
        Opacity(
          opacity: 0.5,
          child: Text(
           '  (${ book.volumeInfo.ratingsCount??'0'})',
            style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
          ),
        ),
      ],
    );
  }
}
