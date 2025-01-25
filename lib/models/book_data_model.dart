// ignore_for_file: non_constant_identifier_names

import 'package:book_shelf_app/models/book_series_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_data_model.g.dart';

@JsonSerializable()
class BookDataModel {
  final int id;
  final String title;
  final String author;
  final BookSeriesModel? series;
  final String cover_url;

  BookDataModel({required this.id, required this.title, required this.author, required this.series, required this.cover_url});
  
  factory BookDataModel.fromJson(Map<String, dynamic> json) =>
      _$BookDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookDataModelToJson(this);
}