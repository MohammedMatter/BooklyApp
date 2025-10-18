import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar_details.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  BookDetailsSection({
    super.key,
    required this.book,
    required this.width,
    required this.height,
  });
  BookModel book;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarDetails(),
        BookImageContainer(
          width: width * .4,
          height: height * 0.25,
          image: book.volumeInfo.imageLinks!.smallThumbnail!,
        ),
        SizedBox(height: height * 0.05),
        Text(
          book.volumeInfo.title,
          style: Styles.textStyle20.copyWith(fontFamily: 'GT font'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.01),
        Column(
          children:
              book.volumeInfo.authors!
                  .map(
                    (auther) => Text(
                      auther,
                      textAlign: TextAlign.center,
                      style: Styles.textStyle18.copyWith(
                        color: Color(0xff707070),
                        fontFamily: 'montserratItalic',
                      ),
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: height * 0.02),
        BookRating(
          widget: HomePageBody(height: height, width: width),
          book: book,
        ),
        SizedBox(height: height * 0.02),
        BookActionButtons(height: height, width: width, book: book),
      ],
    );
  }
}
