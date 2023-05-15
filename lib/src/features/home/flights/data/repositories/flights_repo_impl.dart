import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';

class FlightsRepositoryImpl extends FlightsRepository {
  final FlightsApi flightsApi;

  FlightsRepositoryImpl(this.flightsApi);

  /// Flights method
  @override
  Future<Either<Failure, FilteringFlightsResponseModel>> flights(
      FlightsParams params) async {
    try {
      final result = await flightsApi.filteringFlights(params);
      if (result.data == null) {
        return Left(ServerFailure(unknownError, 400));
      }
      return Right(result.data!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
