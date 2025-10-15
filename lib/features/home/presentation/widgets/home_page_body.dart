import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_list_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  BookViewModel bookController = Get.put(BookViewModel(), permanent: true);
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
        if (controller.isLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: const Color.fromARGB(255, 219, 215, 215),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              5,
                              (index) => Container(
                                margin: EdgeInsets.only(right: 20),
                                width: width * 0.38,
                                height: height * 0.26,
                                decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 51, bottom: 20),
                      child: SizedBox(height: widget.height * 0.02),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          5,
                          (index) => Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20, bottom: 10),
                                width: widget.width * 0.25,
                                height: widget.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                 height: widget.height * 0.2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      width: widget.width * 0.5,
                                      height: widget.height * 0.003,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      width: widget.width * 0.25,
                                      height: widget.height * 0.003,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      width: widget.width * 0.25,
                                      height: widget.height * 0.003,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
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
