// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDetailsModel _$PaginationDetailsModelFromJson(
        Map<String, dynamic> json) =>
    PaginationDetailsModel(
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      countInPage: json['countInPage'] as int,
      total: json['total'] as int,
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      first: json['first'] as int,
    );

Map<String, dynamic> _$PaginationDetailsModelToJson(
        PaginationDetailsModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'countInPage': instance.countInPage,
      'total': instance.total,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
      'first': instance.first,
    };
