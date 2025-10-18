import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/repositories/book_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class BookViewModel extends GetxController {
  var feateuredBooks = <BookModel>[].obs;
  var bestSellerBooks = <BookModel>[].obs;
  BookRepository bookRepository;
  BookViewModel(this.bookRepository);
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  Future fetchFeaturedBooks() async {
    isLoading(true);
    final books = await bookRepository.fetchFeaturedBooks();
    books.fold(
      (failure) => error(failure.error),
      (books) => feateuredBooks.assignAll(books),
    );

    isLoading(false);
  }

  Future fetchBestSellerBooks() async {
    isLoading(true);
    final books = await bookRepository.fetchBestSellerBooks();
    books.fold(
      (failure) => failure.error,
      (books) => bestSellerBooks.assignAll(books),
    );
    isLoading(false);
  }

  @override
  void onInit() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.contains( ConnectivityResult.none)) {
        error('No Internet Connection');
      } else {
        if (event.isNotEmpty) error('');
      }
    });
    super.onInit();
    fetchFeaturedBooks();
    fetchBestSellerBooks();
  }
}
