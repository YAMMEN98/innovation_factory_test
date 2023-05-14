
import 'package:json_annotation/json_annotation.dart';
part 'passenger_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PassengerModel {
  PassengerModel({
    required this.baggage,
    required this.cabinBaggage,
    required this.type,
    required this.quantity,
    required this.priceBase,
    required this.priceService,
    required this.priceSurcharges,
    required this.priceTaxes,
    required this.priceTotal,
    required this.refundAllowed,
    required this.refundPenaltyAmount,
    required this.changeAllowed,
    required this.changePenaltyAmount,
  });

  @JsonKey(name: "Baggage")
   final List<String> baggage;

  @JsonKey(name: "CabinBaggage")
  final List<String> cabinBaggage;

  @JsonKey(name: "Type")
  final String type;

  @JsonKey(name: "Quantity")
  final int quantity;

  @JsonKey(name: "price_Base")
  final String priceBase;

  @JsonKey(name: "price_Service")
  final String priceService;

  @JsonKey(name: "price_Surcharges")
  final String priceSurcharges;

  @JsonKey(name: "price_Taxes")
  final String priceTaxes;

  @JsonKey(name: "price_Total")
  final String priceTotal;

   @JsonKey(name: "RefundAllowed")
   final bool refundAllowed;

   @JsonKey(name: "RefundPenaltyAmount")
   final String refundPenaltyAmount;

  @JsonKey(name: "ChangeAllowed")
  final bool changeAllowed;

  @JsonKey(name: "ChangePenaltyAmount")
  final String changePenaltyAmount;

  factory PassengerModel.fromJson(json) => _$PassengerModelFromJson(json);

  toJson() => _$PassengerModelToJson(this);

  static List<PassengerModel> fromJsonList(List json) {
    return json.map((e) => PassengerModel.fromJson(e)).toList();
  }
}

