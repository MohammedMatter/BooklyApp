import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_suggestions_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/books_details_section.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody({
    super.key,
    required this.width,
    required this.height,
    required this.book,
  });

  final double width;
  final double height;
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(height: height, width: width, book: book),
              Expanded(child: SizedBox(height: height * 0.05)),
              BookSuggestionsSection(width: width, height: height , book: book,),
              SizedBox(height: height * 0.074),
            ],
          ),
        ),
      ],
    );
  }
}
