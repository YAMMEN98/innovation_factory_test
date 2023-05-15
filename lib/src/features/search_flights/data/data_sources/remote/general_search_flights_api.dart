import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

abstract class GeneralSearchFlightsApi {
  final Dio dio;

  GeneralSearchFlightsApi(this.dio);

  Future<ApiResponse<String>> searchFlights(SearchFlightsParams params);
}
