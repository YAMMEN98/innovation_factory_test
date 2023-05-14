// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FareTotalModel _$FareTotalModelFromJson(Map<String, dynamic> json) =>
    FareTotalModel(
      Basic: json['Basic'] as String,
      ServiceTax: json['ServiceTax'] as String,
      TotalTax: json['TotalTax'] as String,
      Total: json['Total'] as String,
    );

Map<String, dynamic> _$FareTotalModelToJson(FareTotalModel instance) =>
    <String, dynamic>{
      'Basic': instance.Basic,
      'ServiceTax': instance.ServiceTax,
      'TotalTax': instance.TotalTax,
      'Total': instance.Total,
    };
