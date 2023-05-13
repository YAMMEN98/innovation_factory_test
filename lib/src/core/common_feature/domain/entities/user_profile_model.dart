import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfileModel {
  final int id;
  @JsonKey(name: "firstName")
  final String firstName;

  @JsonKey(name: "lastName")
  final String lastName;
  final String email;
  final String? emailVerifiedAt;
  final String phone;
  final String? image;
  final String? displayName;
  final String? dob;
  final String? nationality;
  final String gender;
  final String? address;

  @JsonKey(name: "isAdmin")
  final int isAdmin;

  @JsonKey(name: "isSubscribed")
  final int isSubscribed;
  final String referCode;
  final String? notificationType;
  final String contactEmail;
  final int referUser;
  final String lastPublicKey;
  final int balance;
  final int referGift;
  final int cashGift;
  final int creditNote;
  final List<dynamic> referCashback;
  final List<dynamic> giftCashback;
  final List<dynamic> creditNoteCashback;
  final List<dynamic> plans;


  UserProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.image,
    required this.displayName,
    required this.dob,
    required this.nationality,
    required this.gender,
    required this.address,
    required this.isAdmin,
    required this.isSubscribed,
    required this.referCode,
    required this.notificationType,
    required this.contactEmail,
    required this.referUser,
    required this.lastPublicKey,
    required this.balance,
    required this.referGift,
    required this.cashGift,
    required this.creditNote,
    required this.referCashback,
    required this.giftCashback,
    required this.creditNoteCashback,
    required this.plans,
  });

  factory UserProfileModel.fromJson(json) => _$UserProfileModelFromJson(json);

  toJson() => _$UserProfileModelToJson(this);

  static List<UserProfileModel> fromJsonList(List json) {
    return json.map((e) => UserProfileModel.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileModel && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
