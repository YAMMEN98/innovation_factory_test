import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';

abstract class FlightsRepository {
  Future<Either<Failure, FilteringFlightsResponseModel>> flights(FlightsParams params);
}
