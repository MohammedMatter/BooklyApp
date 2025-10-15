
import 'dart:developer';

import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:go_router/go_router.dart';

class BookListSlider extends StatelessWidget {
  const BookListSlider({
    super.key,
 
    required this.widget,
    required PageController pageController,
    required this.currentPage,
  }) : _pageController = pageController;
  final HomePageBody widget;
  final PageController _pageController;
  final double currentPage;


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: widget.height * 0.3,
      child: GetX<BookViewModel>(
        builder: (controller) => 
         PageView.builder(
          padEnds: false,
          controller: _pageController,
          itemBuilder: (context, index) {
            final scale = 1 - (currentPage - index).abs() * 0.2;
            final opacity =
                1 - ((currentPage - index).abs() * 0.5).clamp(0.0, 0.8);
            if (index ==controller.books.length) {
              return SizedBox(width: widget.width * 0.1);
            }
            return Transform.scale(
              scale: scale.clamp(0.8, 1.0),
              child: Opacity(
                opacity: opacity,
                child: GestureDetector(
                  onTap:
                      () => {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                        if (currentPage.round() == index)
                          {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouter.kDetailsPage , extra:controller.books[index] ),
                          },
                      },
                  child: BookImageContainer(
                    image: controller.books[index].volumeInfo.imageLinks!.smallThumbnail!,
                    width: widget.width,
                    height: widget.height * 0.2,
                  ),
                ),
              ),
            );
          },
          itemCount: controller.books.length,
        ),
      ),
    );
  }
}
