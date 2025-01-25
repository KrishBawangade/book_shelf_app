import 'package:book_shelf_app/models/book_data_model.dart';
import 'package:book_shelf_app/models/books_api_response_model.dart';
import 'package:book_shelf_app/services/books_api_client.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  BooksProvider() {
    _loadBookList();
  }

  List<BookDataModel> _bookList = [];
  List<BookDataModel> _selectedBookList = [];
  bool _isLoading = false; 

  List<BookDataModel> get bookList => _bookList;
  List<BookDataModel> get selectedBookList => _selectedBookList;
  bool get isLoading => _isLoading;

  Future<void> _loadBookList() async {

    _isLoading = true;
    notifyListeners();

    BooksApiClient booksApiClient = BooksApiClient();

    try {
      BooksApiResponseModel booksApiResponse =
          await booksApiClient.getBooksApiResponse();
      _bookList = booksApiResponse.data.books;
    } on Exception catch (e) {
      debugPrint("Error Occurred while fetching book list from api: $e!!");
    }
    _isLoading = false;
    notifyListeners();
  }


  void setSelectedBookList({required List<BookDataModel> bookList}){
    _selectedBookList = bookList;
    notifyListeners();
  }
}
