import 'package:json_annotation/json_annotation.dart';

part 'tour_segement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class TourSegmentModel {
  TourSegmentModel({
    required this.SeatsRemaining,
    required this.FlightNumber,
    required this.AirlineCode,
    required this.AirlineName,
    required this.DepartureAirportCode,
    required this.DepartureDateTime,
    required this.ArrivalAirportCode,
    required this.ArrivalDateTime,
    required this.CabinClassCode,
    required this.JourneyDuration,
    required this.CabinClassText,
  });

  // @JsonKey(name: "SeatsRemaining")
   final int SeatsRemaining;

  // @JsonKey(name: "FlightNumber")
  final String FlightNumber;

  // @JsonKey(name: "AirlineCode")
  final String AirlineCode;

  // @JsonKey(name: "AirlineName")
  final String AirlineName;

  // @JsonKey(name: "DepartureAirportCode")
  final String DepartureAirportCode;

  // @JsonKey(name: "DepartureDateTime")
  final String DepartureDateTime;

  // @JsonKey(name: "ArrivalAirportCode")
  final String ArrivalAirportCode;

  // @JsonKey(name: "ArrivalDateTime")
  final String ArrivalDateTime;

  // @JsonKey(name: "CabinClassCode")
  final String CabinClassCode;

  // @JsonKey(name: "JourneyDuration")
  final String JourneyDuration;

  // @JsonKey(name: "CabinClassText")
  final String CabinClassText;

  factory TourSegmentModel.fromJson(json) => _$TourSegmentModelFromJson(json);

  toJson() => _$TourSegmentModelToJson(this);

  static List<TourSegmentModel> fromJsonList(List json) {
    return json.map((e) => TourSegmentModel.fromJson(e)).toList();
  }
}

