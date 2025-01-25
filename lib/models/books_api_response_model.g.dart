// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksApiResponseModel _$BooksApiResponseModelFromJson(
        Map<String, dynamic> json) =>
    BooksApiResponseModel(
      data: BooksApiDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BooksApiResponseModelToJson(
        BooksApiResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
