import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

abstract class SearchFlightsRepository {
  Future<Either<Failure, String>> searchFlights(SearchFlightsParams params);
}
