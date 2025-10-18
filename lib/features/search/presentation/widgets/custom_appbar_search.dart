import 'package:bookly_app/features/home/data/repositories_impl/book_repository_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarSearch extends StatelessWidget {
  CustomAppBarSearch({super.key, required this.width, required this.height});

  final double width;
  final double height;
  BookViewModel bookVm = Get.put(BookViewModel(BookRepositoryImpl()));
  SearchViewModel searchVM = Get.put(SearchViewModel());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                searchVM.clearSearchData();
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
