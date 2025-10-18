import 'dart:developer';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  RxString searchValue = ''.obs;
  List<BookModel> filterdList = <BookModel>[].obs;
  final BookViewModel bookViewModel = Get.find<BookViewModel>();
  void serarchBook(String query) {
    searchValue.value = query;
    if (query.isEmpty) {
      filterdList.assignAll(bookViewModel.feateuredBooks);
    } else {
      filterdList.assignAll(
        bookViewModel.feateuredBooks.where((book) {
          String titleBook = book.volumeInfo.title.toUpperCase();
          return titleBook.toUpperCase().trim().contains(
            query.toUpperCase().trim(),
          );
        }),
      );
    }
  }

  void clearSearchData() {
    searchValue.value = '';
     filterdList.assignAll(bookViewModel.feateuredBooks);
  }

  @override
  void onInit() {
    log('init');
    super.onInit();
    filterdList.assignAll(bookViewModel.feateuredBooks);
  }

  @override
  void onClose() {
    log('message');
    // TODO: implement onClose
    super.onClose();
    filterdList.clear();
    searchValue.value = '';
  }
}
