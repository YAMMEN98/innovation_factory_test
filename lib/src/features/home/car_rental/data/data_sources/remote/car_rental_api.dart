import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/data_sources/remote/general_car_rental_api.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/usecases/car_rental_usecase.dart';

class CarRentalApi extends GeneralCarRentalApi {
  CarRentalApi(super.dio);

  /// Flights method
  Future<ApiResponse<String>> carRental(CarRentalParams params) async {
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
