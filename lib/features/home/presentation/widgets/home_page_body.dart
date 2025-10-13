import 'package:bookly_app/core/utils/styles.dart';
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
  PageController _pageController = PageController(viewportFraction: 0.6);
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 50),
                      child: Text('Best Seller', style: Styles.titleMedium),
                    ),

                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BookImageContainer(width: widget.width),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widget.width * 0.45,
                                child: Text(
                                  'Harry Potter and the Goblet of Fire',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'GT font',

                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ),

                              Text(
                                'J.K. Rowling',
                                style: TextStyle(color: Color(0xff707070)),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '19.99 €',
                                    style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),
                                      Text(
                                        '4.8 ',
                                        style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '(2390)',
                                        style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                            255,
                                            70,
                                            68,
                                            68,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: widget.width * 0.001),
                                ],
                              ),
                              SizedBox(height: widget.height * 0.09),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
