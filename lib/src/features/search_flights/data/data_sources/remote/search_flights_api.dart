import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/data_sources/remote/general_search_flights_api.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

class SearchFlightsApi extends GeneralSearchFlightsApi {
  SearchFlightsApi(super.dio);

  /// Search Flights Method
  @override
  Future<ApiResponse<String>> searchFlights(SearchFlightsParams params) async {
    try {
      final result = (await dio.get("")).data;
      return ApiResponse();
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
