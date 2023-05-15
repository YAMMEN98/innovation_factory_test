import 'package:json_annotation/json_annotation.dart';

part 'filter_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilterCategoryModel {
  FilterCategoryModel({
    required this.fareType,
    required this.price,
    required this.stopsDeparture,
    required this.stopsReturn,
    required this.durationDeparture,
    required this.durationReturn,
    required this.airlineDeparture,
    required this.airlineReturn,
  });
   final List<String> fareType;
   final List<double> price;
   final List<int> stopsDeparture;
   final List<int> stopsReturn;
   final List<int> durationDeparture;
   final List<int> durationReturn;
   final List<String> airlineDeparture;
   final List<String> airlineReturn;


  factory FilterCategoryModel.fromJson(json) => _$FilterCategoryModelFromJson(json);

  toJson() => _$FilterCategoryModelToJson(this);

  static List<FilterCategoryModel> fromJsonList(List json) {
    return json.map((e) => FilterCategoryModel.fromJson(e)).toList();
  }
}