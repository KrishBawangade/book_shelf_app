import 'package:book_shelf_app/models/books_api_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_api_response_model.g.dart';

@JsonSerializable()
class BooksApiResponseModel{
  final BooksApiDataModel data;

  BooksApiResponseModel({required this.data});

  factory BooksApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BooksApiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksApiResponseModelToJson(this);
}