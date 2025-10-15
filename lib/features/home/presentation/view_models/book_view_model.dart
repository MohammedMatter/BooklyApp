import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/book_repository.dart';
import 'package:get/get.dart';

class BookViewModel extends GetxController {
  var books = <BookModel>[].obs;
  RxBool isLoading = false.obs;

  BookRepository bookRepository = BookRepository();

  Future fetchBooks() async {
    try {
      isLoading(true);
      final result = await bookRepository.getBooks();
      await Future.delayed(Duration(seconds: 3), () => isLoading(false));
      books.assignAll(result);
    } on Exception catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }
}
