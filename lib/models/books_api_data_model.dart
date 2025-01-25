import 'package:book_shelf_app/models/book_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_api_data_model.g.dart';

@JsonSerializable()
class BooksApiDataModel{
  final List<BookDataModel> books;
  final int count;

  BooksApiDataModel({required this.books, required this.count});

  factory BooksApiDataModel.fromJson(Map<String, dynamic> json) =>
      _$BooksApiDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksApiDataModelToJson(this);

}