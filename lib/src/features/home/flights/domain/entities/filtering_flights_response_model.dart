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
     this.paginationDetails,
     this.filterCategories,
  });
  
   final String sessionId;
   final List<FlightModel> flights;
   final PaginationDetailsModel? paginationDetails;

   @JsonKey(name: "filterCategories")
   final FilterCategoryModel? filterCategories;

  factory FilteringFlightsResponseModel.fromJson(json) => _$FilteringFlightsResponseModelFromJson(json);

  toJson() => _$FilteringFlightsResponseModelToJson(this);

  static List<FilteringFlightsResponseModel> fromJsonList(List json) {
    return json.map((e) => FilteringFlightsResponseModel.fromJson(e)).toList();
  }


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilteringFlightsResponseModel && other.sessionId == sessionId;
  }

}
