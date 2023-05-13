import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/general_flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

class FlightsApi extends GeneralFlightsApi {
  FlightsApi(super.dio);

  /// Flights method
  Future<ApiResponse<String>> flights(FlightsParams params) async {
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
