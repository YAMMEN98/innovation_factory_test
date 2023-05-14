// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_segement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourSegmentModel _$TourSegmentModelFromJson(Map<String, dynamic> json) =>
    TourSegmentModel(
      SeatsRemaining: json['SeatsRemaining'] as int,
      FlightNumber: json['FlightNumber'] as String,
      AirlineCode: json['AirlineCode'] as String,
      AirlineName: json['AirlineName'] as String,
      DepartureAirportCode: json['DepartureAirportCode'] as String,
      DepartureDateTime: json['DepartureDateTime'] as String,
      ArrivalAirportCode: json['ArrivalAirportCode'] as String,
      ArrivalDateTime: json['ArrivalDateTime'] as String,
      CabinClassCode: json['CabinClassCode'] as String,
      JourneyDuration: json['JourneyDuration'] as String,
      CabinClassText: json['CabinClassText'] as String,
    );

Map<String, dynamic> _$TourSegmentModelToJson(TourSegmentModel instance) =>
    <String, dynamic>{
      'SeatsRemaining': instance.SeatsRemaining,
      'FlightNumber': instance.FlightNumber,
      'AirlineCode': instance.AirlineCode,
      'AirlineName': instance.AirlineName,
      'DepartureAirportCode': instance.DepartureAirportCode,
      'DepartureDateTime': instance.DepartureDateTime,
      'ArrivalAirportCode': instance.ArrivalAirportCode,
      'ArrivalDateTime': instance.ArrivalDateTime,
      'CabinClassCode': instance.CabinClassCode,
      'JourneyDuration': instance.JourneyDuration,
      'CabinClassText': instance.CabinClassText,
    };
