import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/services/book_service.dart';

class BookRepository {
  final BookService bookService = BookService();
  Future<List<BookModel>> getBooks() async {
    return bookService.fetchBooks();
  }
}
