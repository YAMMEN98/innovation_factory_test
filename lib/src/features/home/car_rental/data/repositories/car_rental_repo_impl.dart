import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/data_sources/locale/car_rental_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/data_sources/remote/car_rental_api.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/repositories/car_rental_repository.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/usecases/car_rental_usecase.dart';


class CarRentalRepositoryImpl extends CarRentalRepository {
  final CarRentalApi carRentalApi;
  final CarRentalSharedPrefs carRentalPrefs;

  CarRentalRepositoryImpl(this.carRentalApi, this.carRentalPrefs);

  /// Car Rental method
  @override
  Future<Either<Failure, String>> carRental(CarRentalParams params) async {
    try {
      final result = await carRentalApi.carRental(params);
      return Right("");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
