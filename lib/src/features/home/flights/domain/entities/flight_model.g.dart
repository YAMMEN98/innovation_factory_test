// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) => FlightModel(
      ticketType: json['ticketType'] as String,
      IsPassportMandatory: json['IsPassportMandatory'] as bool?,
      sourceCode: json['sourceCode'] as String,
      FareType: json['FareType'] as String,
      IsRefundable: json['IsRefundable'] as String,
      type: json['type'] as String,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => PassengerModel.fromJson(e))
          .toList(),
      tours: (json['tours'] as List<dynamic>)
          .map((e) => TourModel.fromJson(e))
          .toList(),
      fareTotal: FareTotalModel.fromJson(json['fareTotal']),
    );

Map<String, dynamic> _$FlightModelToJson(FlightModel instance) =>
    <String, dynamic>{
      'ticketType': instance.ticketType,
      'IsPassportMandatory': instance.IsPassportMandatory,
      'sourceCode': instance.sourceCode,
      'FareType': instance.FareType,
      'IsRefundable': instance.IsRefundable,
      'type': instance.type,
      'passengers': instance.passengers,
      'tours': instance.tours,
      'fareTotal': instance.fareTotal,
    };
