import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/repositories/car_rental_repository.dart';

class CarRentalUseCase extends UseCase<String, CarRentalParams> {
  final CarRentalRepository repository;

  CarRentalUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CarRentalParams params) async {
    final result = await repository.carRental(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class CarRentalParams {
  CarRentalParams();

  CarRentalParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
