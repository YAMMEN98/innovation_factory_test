// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
      TotalStops: json['TotalStops'] as int,
      tourSegments: (json['tourSegments'] as List<dynamic>)
          .map((e) => TourSegmentModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
      'TotalStops': instance.TotalStops,
      'tourSegments': instance.tourSegments,
    };
