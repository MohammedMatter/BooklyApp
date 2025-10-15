import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(width * 0.39, height * 0.057),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                  bottomLeft: Radius.circular(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),

          child: Text(
            '19.99€',
            style: Styles.textStyle20.copyWith(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(width * 0.39, height * 0.057),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                  bottomRight: Radius.circular(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(Color(0xffEF8262)),
          ),

          child: Text(
            'Free preview',
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
