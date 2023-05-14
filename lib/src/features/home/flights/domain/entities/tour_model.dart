import 'package:innovation_factory_test/src/features/home/flights/domain/entities/tour_segement_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tour_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TourModel {
  TourModel({
    required this.TotalStops,
    required this.tourSegments,
  });

  @JsonKey(name: "TotalStops")
   final int TotalStops;

  @JsonKey(name: "tourSegments")
  final List<TourSegmentModel> tourSegments;

  factory TourModel.fromJson(json) => _$TourModelFromJson(json);

  toJson() => _$TourModelToJson(this);

  static List<TourModel> fromJsonList(List json) {
    return json.map((e) => TourModel.fromJson(e)).toList();
  }
}
