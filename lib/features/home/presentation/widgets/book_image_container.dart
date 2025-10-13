import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookImageContainer extends StatelessWidget {
  const BookImageContainer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.5,
      width: width * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssestData.book1),
          fit: BoxFit.fill,
        ),
    
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
