import 'package:json_annotation/json_annotation.dart';

part 'fare_total_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class FareTotalModel {
  FareTotalModel({
    required this.Basic,
    required this.ServiceTax,
    required this.TotalTax,
    required this.Total,
  });
  late final String Basic;
  late final String ServiceTax;
  late final String TotalTax;
  late final String Total;


  factory FareTotalModel.fromJson(json) => _$FareTotalModelFromJson(json);

  toJson() => _$FareTotalModelToJson(this);

  static List<FareTotalModel> fromJsonList(List json) {
    return json.map((e) => FareTotalModel.fromJson(e)).toList();
  }

}
