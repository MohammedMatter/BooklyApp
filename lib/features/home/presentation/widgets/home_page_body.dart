import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/repositories_impl/book_repository_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_list_slider.dart';
import 'package:bookly_app/features/home/presentation/widgets/shimmer_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  BookViewModel bookController = Get.put(BookViewModel(BookRepositoryImpl()), permanent: true);
  final PageController _pageController = PageController(viewportFraction: 0.45);
  double currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetX<BookViewModel>(
      builder: (controller) {
        if (controller.error.isNotEmpty) {
          return Center(
            child: Text(
              '${controller.error} !',
              style: Styles.textStyle20,
            ),
          );
        }
        if (controller.isLoading.value) {
          return ShimmerBody(width: width, height: height, widget: widget);
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookListSlider(
                  widget: widget,
                  pageController: _pageController,
                  currentPage: currentPage,
                ),
                SizedBox(height: widget.height * 0.02),
                BestSelletListViewItem(widget: widget),
              ],
            ),
          ),
        );
      },
    );
  }
}
