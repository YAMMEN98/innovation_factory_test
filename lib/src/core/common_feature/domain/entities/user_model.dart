import 'package:json_annotation/json_annotation.dart';

import 'user_profile_model.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final UserProfileModel user;
  final String token;
  @JsonKey(name: "privateKey")
  final String privateKey;

  UserModel({
    required this.user,
    required this.token,
    required this.privateKey,
  });

  factory UserModel.fromJson(json) => _$UserModelFromJson(json);

  toJson() => _$UserModelToJson(this);

  static List<UserModel> fromJsonList(List json) {
    return json.map((e) => UserModel.fromJson(e)).toList();
  }
}
