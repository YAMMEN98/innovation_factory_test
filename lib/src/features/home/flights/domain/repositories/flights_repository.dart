import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

abstract class FlightsRepository {
  Future<Either<Failure, String>> flights(FlightsParams params);
}
