// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtering_flights_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteringFlightsResponseModel _$FilteringFlightsResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilteringFlightsResponseModel(
      sessionId: json['session_id'] as String,
      flights: (json['flights'] as List<dynamic>)
          .map((e) => FlightModel.fromJson(e))
          .toList(),
      paginationDetails: json['pagination_details'] == null
          ? null
          : PaginationDetailsModel.fromJson(json['pagination_details']),
      filterCategories: json['filterCategories'] == null
          ? null
          : FilterCategoryModel.fromJson(json['filterCategories']),
    );

Map<String, dynamic> _$FilteringFlightsResponseModelToJson(
        FilteringFlightsResponseModel instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'flights': instance.flights,
      'pagination_details': instance.paginationDetails,
      'filterCategories': instance.filterCategories,
    };
