import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthResponseModel {
  AuthResponseModel({
    required this.userId,
    required this.registeredEmail,
  });

  late final int userId;
  late final String registeredEmail;

  factory AuthResponseModel.fromJson(json) => _$AuthResponseModelFromJson(json);

  toJson() => _$AuthResponseModelToJson(this);

  static List<AuthResponseModel> fromJsonList(List json) {
    return json.map((e) => AuthResponseModel.fromJson(e)).toList();
  }
}
