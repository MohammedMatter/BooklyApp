
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController _pageController = PageController(viewportFraction: 0.5);
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
          SizedBox(
            height: widget.height * 0.3,
            child: PageView.builder(
            controller: _pageController,
              itemBuilder: (context, index) {
                final scale = 1 - (currentPage - index).abs() * 0.2;
                final opacity = 1 - (currentPage - index).abs() * 0.5;

                return Transform.scale(
                  scale: scale.clamp(0.8, 1.0),
                  child: Opacity(
                    opacity: opacity,
                    child: BookImageContainer(width: widget.width)),
                );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(height: widget.height * 0.02),
          BestSelletListViewItem(widget: widget),
        ],
      ),
    );
  }
}

