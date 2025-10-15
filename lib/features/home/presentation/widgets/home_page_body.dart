import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_list_slider.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
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
    );
  }
}
