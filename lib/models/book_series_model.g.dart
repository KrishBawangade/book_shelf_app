// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSeriesModel _$BookSeriesModelFromJson(Map<String, dynamic> json) =>
    BookSeriesModel(
      id: (json['id'] as num).toInt(),
      index: (json['index'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$BookSeriesModelToJson(BookSeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'title': instance.title,
    };
