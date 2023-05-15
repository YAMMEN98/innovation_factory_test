import 'package:innovation_factory_test/src/features/home/flights/domain/entities/fare_total_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/passenger_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/tour_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FlightModel {
  FlightModel({
    required this.ticketType,
    this.IsPassportMandatory,
    required this.sourceCode,
    required this.FareType,
    required this.IsRefundable,
    required this.type,
    required this.passengers,
    required this.tours,
    required this.fareTotal,
  });

  @JsonKey(name: "ticketType")
   final String ticketType;

  @JsonKey(name: "IsPassportMandatory")
   final bool? IsPassportMandatory;

  @JsonKey(name: "sourceCode")
  final String sourceCode;

  @JsonKey(name: "FareType")
  final String FareType;

  @JsonKey(name: "IsRefundable")
  final String IsRefundable;

   final String type;

   final List<PassengerModel> passengers;
   final List<TourModel> tours;

   @JsonKey(name: "fareTotal")
   final FareTotalModel fareTotal;

  factory FlightModel.fromJson(json) => _$FlightModelFromJson(json);

  toJson() => _$FlightModelToJson(this);

  static List<FlightModel> fromJsonList(List json) {
    return json.map((e) => FlightModel.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightModel && other.sourceCode == sourceCode;
  }
}
