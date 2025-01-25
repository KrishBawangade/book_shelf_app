import 'dart:convert';

import 'package:book_shelf_app/models/books_api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksApiClient{
  final String _baseUrl = "https://doomscrolling-poc.vercel.app";

  Future<BooksApiResponseModel> getBooksApiResponse() async{
    String endPoint = "books/books_list.json";
    final url = Uri.parse("$_baseUrl/$endPoint");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        BooksApiResponseModel booksApiResponse =
            BooksApiResponseModel.fromJson(jsonDecode(response.body));
        // debugPrint("books List: ${booksApiResponse.data.books}");
        return booksApiResponse;
      } else {
        debugPrint("Error: ${response.statusCode} = ${response.reasonPhrase}");
        return Future.error(
            "Error: ${response.statusCode} = ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Failed to fetch data: $e");
      return Future.error("Failed to fetch data: $e");
    }

  }
}