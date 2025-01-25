// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_api_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksApiDataModel _$BooksApiDataModelFromJson(Map<String, dynamic> json) =>
    BooksApiDataModel(
      books: (json['books'] as List<dynamic>)
          .map((e) => BookDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$BooksApiDataModelToJson(BooksApiDataModel instance) =>
    <String, dynamic>{
      'books': instance.books,
      'count': instance.count,
    };
