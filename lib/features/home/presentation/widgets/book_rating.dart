import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.widget});

  final HomePageBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber),

        Text('4.8 ', style: Styles.textStyle16),

        Opacity(
          opacity: 0.5,
          child: Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
          ),
        ),
      ],
    );
  }
}
