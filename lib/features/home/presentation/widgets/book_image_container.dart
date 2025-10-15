import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookImageContainer extends StatelessWidget {
  const BookImageContainer({super.key, required this.width , required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: height ,
      width: width ,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssestData.book1),
          fit: BoxFit.fill,
        ),

        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
