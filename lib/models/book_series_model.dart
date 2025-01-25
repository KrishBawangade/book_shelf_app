import 'package:json_annotation/json_annotation.dart';

part 'book_series_model.g.dart';

@JsonSerializable()
class BookSeriesModel {
  final int id;
  final int index;
  final String title;

  BookSeriesModel({required this.id, required this.index, required this.title});

  factory BookSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$BookSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookSeriesModelToJson(this);
}