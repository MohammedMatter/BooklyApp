
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar_details.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarDetails(),
        BookImageContainer(width: width * .4, height: height * 0.25),
        SizedBox(height: height * 0.05),
        Text('The Jungle Book', style: Styles.textStyle30),
        SizedBox(height: height * 0.01),
        Text(
          'Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
            color: Color(0xff707070),
            fontFamily: 'montserratItalic',
          ),
        ),
        SizedBox(height: height * 0.02),
        BookRating(widget: HomePageBody(height: height, width: width)),
        SizedBox(height: height * 0.02),
        BookActionButtons(height: height, width: width),
      ],
    );
  }
}