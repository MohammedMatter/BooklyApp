import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/details_page_bode.dart';

import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.book});
  BookModel book;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DetailsBody(width: width, height: height, book: book),
    );
  }
}
