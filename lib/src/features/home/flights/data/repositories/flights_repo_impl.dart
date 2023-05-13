import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/locale/flights_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

class FlightsRepositoryImpl extends FlightsRepository {
  final FlightsApi flightsApi;
  final FlightsSharedPrefs flightsPrefs;

  FlightsRepositoryImpl(this.flightsApi, this.flightsPrefs);

  /// Flights method
  @override
  Future<Either<Failure, String>> flights(FlightsParams params) async {
    try {
      final result = await flightsApi.flights(params);
      return Right("");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
