import 'package:flutter/material.dart';

class BookImageContainer extends StatelessWidget {
  BookImageContainer({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });
  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: width ,
      height: height ,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),

        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
