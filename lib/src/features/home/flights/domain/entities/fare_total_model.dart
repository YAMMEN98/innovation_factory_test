import 'package:json_annotation/json_annotation.dart';

part 'fare_total_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class FareTotalModel {
  FareTotalModel({
    required this.basic,
    required this.serviceTax,
    required this.totalTax,
    required this.total,
  });
  late final String basic;
  late final String serviceTax;
  late final String totalTax;
  late final String total;


  factory FareTotalModel.fromJson(json) => _$FareTotalModelFromJson(json);

  toJson() => _$FareTotalModelToJson(this);

  static List<FareTotalModel> fromJsonList(List json) {
    return json.map((e) => FareTotalModel.fromJson(e)).toList();
  }

}
