// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCategoryModel _$FilterCategoryModelFromJson(Map<String, dynamic> json) =>
    FilterCategoryModel(
      fareType:
          (json['fare_type'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      stopsDeparture: (json['stops_departure'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      stopsReturn:
          (json['stops_return'] as List<dynamic>).map((e) => e as int).toList(),
      durationDeparture: (json['duration_departure'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      durationReturn: (json['duration_return'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      airlineDeparture: (json['airline_departure'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      airlineReturn: (json['airline_return'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterCategoryModelToJson(
        FilterCategoryModel instance) =>
    <String, dynamic>{
      'fare_type': instance.fareType,
      'price': instance.price,
      'stops_departure': instance.stopsDeparture,
      'stops_return': instance.stopsReturn,
      'duration_departure': instance.durationDeparture,
      'duration_return': instance.durationReturn,
      'airline_departure': instance.airlineDeparture,
      'airline_return': instance.airlineReturn,
    };
