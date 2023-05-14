// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_segement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourSegmentModel _$TourSegmentModelFromJson(Map<String, dynamic> json) =>
    TourSegmentModel(
      seatsRemaining: json['SeatsRemaining'] as int,
      flightNumber: json['FlightNumber'] as String,
      airlineCode: json['AirlineCode'] as String,
      airlineName: json['AirlineName'] as String,
      departureAirportCode: json['DepartureAirportCode'] as String,
      departureDateTime: json['DepartureDateTime'] as String,
      arrivalAirportCode: json['ArrivalAirportCode'] as String,
      arrivalDateTime: json['ArrivalDateTime'] as String,
      cabinClassCode: json['CabinClassCode'] as String,
      journeyDuration: json['JourneyDuration'] as String,
      cabinClassText: json['CabinClassText'] as String,
    );

Map<String, dynamic> _$TourSegmentModelToJson(TourSegmentModel instance) =>
    <String, dynamic>{
      'SeatsRemaining': instance.seatsRemaining,
      'FlightNumber': instance.flightNumber,
      'AirlineCode': instance.airlineCode,
      'AirlineName': instance.airlineName,
      'DepartureAirportCode': instance.departureAirportCode,
      'DepartureDateTime': instance.departureDateTime,
      'ArrivalAirportCode': instance.arrivalAirportCode,
      'ArrivalDateTime': instance.arrivalDateTime,
      'CabinClassCode': instance.cabinClassCode,
      'JourneyDuration': instance.journeyDuration,
      'CabinClassText': instance.cabinClassText,
    };
