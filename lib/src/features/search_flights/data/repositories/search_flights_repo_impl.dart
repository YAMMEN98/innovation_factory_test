import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/data_sources/locale/search_flights_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/data_sources/remote/search_flights_api.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/repositories/search_flights_repository.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

class SearchFlightsRepositoryImpl extends SearchFlightsRepository {
  final SearchFlightsApi searchFlightsApi;
  final SearchFlightsSharedPrefs searchFlightsPrefs;

  SearchFlightsRepositoryImpl(this.searchFlightsApi, this.searchFlightsPrefs);

  /// Search Flights Method
  @override
  Future<Either<Failure, String>> searchFlights(SearchFlightsParams params) async {
    try {
      final result = await searchFlightsApi.searchFlights(params);
      return Right("");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
