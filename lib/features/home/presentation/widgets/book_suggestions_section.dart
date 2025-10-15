import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:flutter/material.dart';

class BookSuggestionsSection extends StatelessWidget {
   BookSuggestionsSection({
    
    super.key,
    required this.book , 
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
BookModel book ; 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(fontFamily: 'MontserratBold'),
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder:
                  (context, index) => Align(
                    alignment: Alignment.topCenter,
                    child: BookImageContainer(
                      image: book.volumeInfo.imageLinks!.smallThumbnail!,
                      width: width * 0.3,
                      height: height * 0.2,
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
