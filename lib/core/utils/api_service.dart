import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$url'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw ServerFailure.fromHttpFailure(response);
      }
    } on SocketException {
      throw ServerFailure('No Internet Connection');
    }

  }
}
