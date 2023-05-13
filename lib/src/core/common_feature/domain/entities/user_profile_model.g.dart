// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      phone: json['phone'] as String,
      image: json['image'] as String?,
      displayName: json['display_name'] as String?,
      dob: json['dob'] as String?,
      nationality: json['nationality'] as String?,
      gender: json['gender'] as String,
      address: json['address'] as String?,
      isAdmin: json['isAdmin'] as int,
      isSubscribed: json['isSubscribed'] as int,
      referCode: json['refer_code'] as String,
      notificationType: json['notification_type'] as String?,
      contactEmail: json['contact_email'] as String,
      referUser: json['refer_user'] as int,
      lastPublicKey: json['last_public_key'] as String,
      balance: json['balance'] as int,
      referGift: json['refer_gift'] as int,
      cashGift: json['cash_gift'] as int,
      creditNote: json['credit_note'] as int,
      referCashback: json['refer_cashback'] as List<dynamic>,
      giftCashback: json['gift_cashback'] as List<dynamic>,
      creditNoteCashback: json['credit_note_cashback'] as List<dynamic>,
      plans: json['plans'] as List<dynamic>,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'image': instance.image,
      'display_name': instance.displayName,
      'dob': instance.dob,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'address': instance.address,
      'isAdmin': instance.isAdmin,
      'isSubscribed': instance.isSubscribed,
      'refer_code': instance.referCode,
      'notification_type': instance.notificationType,
      'contact_email': instance.contactEmail,
      'refer_user': instance.referUser,
      'last_public_key': instance.lastPublicKey,
      'balance': instance.balance,
      'refer_gift': instance.referGift,
      'cash_gift': instance.cashGift,
      'credit_note': instance.creditNote,
      'refer_cashback': instance.referCashback,
      'gift_cashback': instance.giftCashback,
      'credit_note_cashback': instance.creditNoteCashback,
      'plans': instance.plans,
    };
