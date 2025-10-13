import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => BookImageContainer(width: width),
              itemCount: 5,
            ),
          ),
          SizedBox(height: height * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Best Seller',
                        style: TextStyle(
                          fontFamily: 'MontserratSemiBold',
                          fontSize: height * 0.026,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookImageContainer(width: width),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.45,
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
                            SizedBox(height: 2),
                            Text(
                              'J.K. Rowling',
                              style: TextStyle(color: Color(0xff707070)),
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                SizedBox(width: width * 0.001),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
