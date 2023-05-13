import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/usecases/car_rental_usecase.dart';

abstract class CarRentalRepository {
  Future<Either<Failure, String>> carRental(CarRentalParams params);
}
