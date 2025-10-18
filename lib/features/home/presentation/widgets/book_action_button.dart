import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionButtons extends StatelessWidget {
  BookActionButtons({
    super.key,
    required this.book,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.057,
          width: width * 0.39,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                MediaQuery.of(context).size.width * 0.03,
              ),
              bottomLeft: Radius.circular(
                MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ),
          child: Text(
            '19.99€',
            style: Styles.textStyle20.copyWith(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              await launchUrl(
                Uri.parse(book.volumeInfo.previewLink!),
                mode: LaunchMode.externalApplication,
              );
            } on Exception {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    'Ohh sorry ,  can\'t launch url',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            }
          },
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
