import 'dart:convert';
import 'dart:developer';

import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<BookModel>> fetchBooks() async {
  
    
    String url = 'https://www.googleapis.com/books/v1/volumes?q=programming';
    final response = await http.get(Uri.parse(url));
        
    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      return (data['items'] as List)
          .map(
            (element) {
              return BookModel.fromJson(element) ; 
            },
          )
          .toList();
    }
    throw Exception('هنالك خطا في جلب البيانات');
  }
}
