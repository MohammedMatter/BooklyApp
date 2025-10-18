import 'package:bookly_app/features/search/presentation/widgets/custom_appbar_search.dart';

import 'package:bookly_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarSearch(width: width, height: height),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomSearchTextField(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
