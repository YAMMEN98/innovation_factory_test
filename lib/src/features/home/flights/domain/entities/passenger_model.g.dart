// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) =>
    PassengerModel(
      Baggage:
          (json['Baggage'] as List<dynamic>).map((e) => e as String).toList(),
      CabinBaggage: (json['CabinBaggage'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      Type: json['Type'] as String,
      Quantity: json['Quantity'] as int,
      priceBase: json['price_base'] as String,
      priceService: json['price_service'] as String,
      priceSurcharges: json['price_surcharges'] as String,
      priceTaxes: json['price_taxes'] as String,
      priceTotal: json['price_total'] as String,
      RefundAllowed: json['RefundAllowed'] as bool,
      RefundPenaltyAmount: json['RefundPenaltyAmount'] as String,
      ChangeAllowed: json['ChangeAllowed'] as bool,
      ChangePenaltyAmount: json['ChangePenaltyAmount'] as String,
    );

Map<String, dynamic> _$PassengerModelToJson(PassengerModel instance) =>
    <String, dynamic>{
      'Baggage': instance.Baggage,
      'CabinBaggage': instance.CabinBaggage,
      'Type': instance.Type,
      'Quantity': instance.Quantity,
      'price_base': instance.priceBase,
      'price_service': instance.priceService,
      'price_surcharges': instance.priceSurcharges,
      'price_taxes': instance.priceTaxes,
      'price_total': instance.priceTotal,
      'RefundAllowed': instance.RefundAllowed,
      'RefundPenaltyAmount': instance.RefundPenaltyAmount,
      'ChangeAllowed': instance.ChangeAllowed,
      'ChangePenaltyAmount': instance.ChangePenaltyAmount,
    };
