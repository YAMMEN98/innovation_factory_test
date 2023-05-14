import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filter_category_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/flight_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/pagination_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filtering_flights_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilteringFlightsResponseModel {
  FilteringFlightsResponseModel({
    required this.sessionId,
    required this.flights,
    required this.paginationDetails,
    required this.filterCategories,
  });
  
   final String sessionId;
   final List<FlightModel> flights;
   final PaginationDetailsModel paginationDetails;

   @JsonKey(name: "filterCategories")
   final FilterCategoryModel filterCategories;

  factory FilteringFlightsResponseModel.fromJson(json) => _$SearchingFlightsResponseModelFromJson(json);

  toJson() => _$SearchingFlightsResponseModelToJson(this);

  static List<FilteringFlightsResponseModel> fromJsonList(List json) {
    return json.map((e) => FilteringFlightsResponseModel.fromJson(e)).toList();
  }
}
