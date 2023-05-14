import 'package:json_annotation/json_annotation.dart';

part 'pagination_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaginationDetailsModel {
  PaginationDetailsModel({
    required this.currentPage,
    required this.totalPages,
    required this.countInPage,
    required this.total,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.first,
  });
  
  @JsonKey(name: "currentPage")
   final int currentPage;

  @JsonKey(name: "totalPages")
   final int totalPages;

  @JsonKey(name: "countInPage")
   final int countInPage;

  @JsonKey(name: "total")
   final int total;

  @JsonKey(name: "hasPreviousPage")
   final bool hasPreviousPage;

  @JsonKey(name: "hasNextPage")
   final bool hasNextPage;

   final int first;

 


  factory PaginationDetailsModel.fromJson(json) => _$PaginationDetailsModelFromJson(json);

  toJson() => _$PaginationDetailsModelToJson(this);

  static List<PaginationDetailsModel> fromJsonList(List json) {
    return json.map((e) => PaginationDetailsModel.fromJson(e)).toList();
  }
}
