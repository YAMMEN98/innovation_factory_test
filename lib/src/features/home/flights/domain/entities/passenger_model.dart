
import 'package:json_annotation/json_annotation.dart';
part 'passenger_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PassengerModel {
  PassengerModel({
    required this.Baggage,
    required this.CabinBaggage,
    required this.Type,
    required this.Quantity,
    required this.priceBase,
    required this.priceService,
    required this.priceSurcharges,
    required this.priceTaxes,
    required this.priceTotal,
    required this.RefundAllowed,
    required this.RefundPenaltyAmount,
    required this.ChangeAllowed,
    required this.ChangePenaltyAmount,
  });

  @JsonKey(name: "Baggage")
   final List<String> Baggage;

  @JsonKey(name: "CabinBaggage")
  final List<String> CabinBaggage;

  @JsonKey(name: "Type")
  final String Type;

  @JsonKey(name: "Quantity")
  final int Quantity;

  final String priceBase;
   final String priceService;
   final String priceSurcharges;
   final String priceTaxes;
   final String priceTotal;

   @JsonKey(name: "RefundAllowed")
   final bool RefundAllowed;

   @JsonKey(name: "RefundPenaltyAmount")
   final String RefundPenaltyAmount;

  @JsonKey(name: "ChangeAllowed")
  final bool ChangeAllowed;

  @JsonKey(name: "ChangePenaltyAmount")
  final String ChangePenaltyAmount;

  factory PassengerModel.fromJson(json) => _$PassengerModelFromJson(json);

  toJson() => _$PassengerModelToJson(this);

  static List<PassengerModel> fromJsonList(List json) {
    return json.map((e) => PassengerModel.fromJson(e)).toList();
  }
}

