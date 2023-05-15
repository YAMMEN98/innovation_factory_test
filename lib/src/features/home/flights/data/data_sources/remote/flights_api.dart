import 'package:dio/dio.dart';
import 'package:innovation_factory_test/main.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/general_flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';

class FlightsApi extends GeneralFlightsApi {
  FlightsApi(super.dio);

  /// Flights method
  Future<ApiResponse<FilteringFlightsResponseModel>> filteringFlights(
      FlightsParams params) async {
    try {
      final result = (await dio.post(
        "flights",
        data: params.toJson(),
      ));
      ApiResponse<FilteringFlightsResponseModel> response =
          ApiResponse.fromJson(
              result.data, FilteringFlightsResponseModel.fromJson);
      if (response.status == null || response.status == false || response.data == null) {
        throw ServerException(
            response.message ?? S.of(navigatorKey.currentContext!).server_error,
            result.statusCode);
      }
      return response;
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
