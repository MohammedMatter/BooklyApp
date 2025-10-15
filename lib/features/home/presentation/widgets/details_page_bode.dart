
import 'package:bookly_app/features/home/presentation/widgets/book_suggestions_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/books_details_section.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(height: height, width: width),
              Expanded(child: SizedBox(height: height * 0.05)),
              BookSuggestionsSection(width: width, height: height),
              SizedBox(height: height * 0.074),
            ],
          ),
        ),
      ],
    );
  }
}
