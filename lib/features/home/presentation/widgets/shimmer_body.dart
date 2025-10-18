import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBody extends StatelessWidget {
  const ShimmerBody({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
  });

  final double width;
  final double height;
  final HomePageBody widget;

  @override
  Widget build(BuildContext context) {
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
}