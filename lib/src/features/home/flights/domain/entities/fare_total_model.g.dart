// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FareTotalModel _$FareTotalModelFromJson(Map<String, dynamic> json) =>
    FareTotalModel(
      basic: json['Basic'] as String,
      serviceTax: json['ServiceTax'] as String,
      totalTax: json['TotalTax'] as String,
      total: json['Total'] as String,
    );

Map<String, dynamic> _$FareTotalModelToJson(FareTotalModel instance) =>
    <String, dynamic>{
      'Basic': instance.basic,
      'ServiceTax': instance.serviceTax,
      'TotalTax': instance.totalTax,
      'Total': instance.total,
    };
