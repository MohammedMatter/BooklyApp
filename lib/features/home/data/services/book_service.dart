

import 'dart:convert';

import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<BookModel>> fetchBooks() async {
    String url = 'https://www.googleapis.com/books/v1/volumes?q=programming';
    final resposne = await http.get(Uri.parse(url));
    if (resposne.statusCode == 200) {
      final data = jsonDecode(resposne.body);
      return (data['items'] as List)
          .map((element) => BookModel.fromJson(element))
          .toList();
    }
    throw Exception('هنالك خطا في جلب البيانات') ; 
  }
}
