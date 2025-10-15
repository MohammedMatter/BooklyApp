import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BestSelletListViewItem extends StatelessWidget {
  const BestSelletListViewItem({super.key, required this.widget});

  final HomePageBody widget;

  @override
  Widget build(BuildContext context) {
    return GetX<BookViewModel>(
      builder:
          (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                controller.books
                    .map(
                      (book) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.books.indexOf(book) == 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                                top: 51,
                              ),
                              child: Text(
                                'Best Seller',
                                style: Styles.textStyle20,
                              ),
                            ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: BookImageContainer(
                                  image:
                                      book
                                          .volumeInfo
                                          .imageLinks!
                                          .smallThumbnail!,
                                  width: widget.width * 0.25,
                                  height: widget.height * 0.2,
                                ),
                              ),
                          
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: widget.width * 0.45,
                                      child: Text(
                                        book.volumeInfo.title,
                                        maxLines: 2,
                                        style: Styles.textStyle20.copyWith(
                                          fontFamily: 'GT font',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: widget.height * 0.01),
                          
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:
                                          book.volumeInfo.authors!
                                              .map(
                                                (e) => Text(
                                                  e,
                                                  style: TextStyle(
                                                    color: Color(0xff707070),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                    ),
                          
                                    SizedBox(height: widget.height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          book.saleInfo.saleability=="NOT_FOR_SALE"?'Not For Sale':'Free' , 
                                          style: Styles.textStyle18,
                                        ),
                                        Spacer(),
                                        BookRating(widget: widget , rating:book.volumeInfo.averageRating,book: book,),
                                        SizedBox(width: widget.width * 0.001),
                                        
                                      ],
                                    ),
                             
                                  ],
                                ),
                              ),
                          
                            ],
                          ),
                            Divider()
                        ],
                      ),
                    )
                    .toList(),
          ),
    );
  }
}
