import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/general_flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

class FlightsApi extends GeneralFlightsApi{
  FlightsApi(super.dio);

  /// Flights method
  Future<Either<Failure, String>> flights(
  FlightsParams params) async {
    try {
      final result = (await dio.get("")).data;
      return Right("");

      /// Handle Success/Failure Response To Return Right Or Left
      // if (result['code'] == "0" || result['code'] == 0) {
      //   return Right("");
      // } else {
      //   return Left(ServerFailure(result['msg'] ?? S.of(navigatorKey.currentContext!).server_error, null));
      // }
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
