import 'package:json_annotation/json_annotation.dart';

part 'tour_segement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class TourSegmentModel {
  TourSegmentModel({
    required this.seatsRemaining,
    required this.flightNumber,
    required this.airlineCode,
    required this.airlineName,
    required this.departureAirportCode,
    required this.departureDateTime,
    required this.arrivalAirportCode,
    required this.arrivalDateTime,
    required this.cabinClassCode,
    required this.journeyDuration,
    required this.cabinClassText,
  });

  // @JsonKey(name: "SeatsRemaining")
   final int seatsRemaining;

  // @JsonKey(name: "FlightNumber")
  final String flightNumber;

  // @JsonKey(name: "AirlineCode")
  final String airlineCode;

  // @JsonKey(name: "AirlineName")
  final String airlineName;

  // @JsonKey(name: "DepartureAirportCode")
  final String departureAirportCode;

  // @JsonKey(name: "DepartureDateTime")
  final String departureDateTime;

  // @JsonKey(name: "ArrivalAirportCode")
  final String arrivalAirportCode;

  // @JsonKey(name: "ArrivalDateTime")
  final String arrivalDateTime;

  // @JsonKey(name: "CabinClassCode")
  final String cabinClassCode;

  // @JsonKey(name: "JourneyDuration")
  final String journeyDuration;

  // @JsonKey(name: "CabinClassText")
  final String cabinClassText;

  factory TourSegmentModel.fromJson(json) => _$TourSegmentModelFromJson(json);

  toJson() => _$TourSegmentModelToJson(this);

  static List<TourSegmentModel> fromJsonList(List json) {
    return json.map((e) => TourSegmentModel.fromJson(e)).toList();
  }
}

