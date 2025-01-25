// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDataModel _$BookDataModelFromJson(Map<String, dynamic> json) =>
    BookDataModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      series: json['series'] == null
          ? null
          : BookSeriesModel.fromJson(json['series'] as Map<String, dynamic>),
      cover_url: json['cover_url'] as String,
    );

Map<String, dynamic> _$BookDataModelToJson(BookDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'series': instance.series,
      'cover_url': instance.cover_url,
    };
