// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) =>
    PassengerModel(
      baggage:
          (json['Baggage'] as List<dynamic>).map((e) => e as String).toList(),
      cabinBaggage: (json['CabinBaggage'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String,
      quantity: json['Quantity'] as int,
      priceBase: json['price_Base'] as String,
      priceService: json['price_Service'] as String,
      priceSurcharges: json['price_Surcharges'] as String,
      priceTaxes: json['price_Taxes'] as String,
      priceTotal: json['price_Total'] as String,
      refundAllowed: json['RefundAllowed'] as bool,
      refundPenaltyAmount: json['RefundPenaltyAmount'] as String,
      changeAllowed: json['ChangeAllowed'] as bool,
      changePenaltyAmount: json['ChangePenaltyAmount'] as String,
    );

Map<String, dynamic> _$PassengerModelToJson(PassengerModel instance) =>
    <String, dynamic>{
      'Baggage': instance.baggage,
      'CabinBaggage': instance.cabinBaggage,
      'Type': instance.type,
      'Quantity': instance.quantity,
      'price_Base': instance.priceBase,
      'price_Service': instance.priceService,
      'price_Surcharges': instance.priceSurcharges,
      'price_Taxes': instance.priceTaxes,
      'price_Total': instance.priceTotal,
      'RefundAllowed': instance.refundAllowed,
      'RefundPenaltyAmount': instance.refundPenaltyAmount,
      'ChangeAllowed': instance.changeAllowed,
      'ChangePenaltyAmount': instance.changePenaltyAmount,
    };
