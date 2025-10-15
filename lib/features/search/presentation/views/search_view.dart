import 'package:bookly_app/core/utils/styles.dart';

import 'package:bookly_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(),
              SizedBox(height: 30),
              Text(
                'Search Result',
                style: Styles.textStyle20.copyWith(fontFamily: ''),
              ),
              SizedBox(height: 30),
              SearchResultListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        5,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: BookImageContainer(
                //     width: width * 0.25,
                //     height: height * 0.2,
                //   ),
                // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: Text(
                          'Harry Potter and the Goblet of Fire',
                          maxLines: 2,
                          style: Styles.textStyle20.copyWith(
                            fontFamily: 'GT font',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'J.K. Rowling',
                        style: TextStyle(color: Color(0xff707070)),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('19.99 €', style: Styles.textStyle20),
                          // BookRating(
            
                          //   widget: HomePageBody(
                          //     height: height,
                          //     width: width,
                          //   ),
                          // ),
                          SizedBox(width: width * 0.001),
                        ],
                      ),
                      SizedBox(height: height * 0.09),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
