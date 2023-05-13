import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';

class FlightsUseCase extends UseCase<String, FlightsParams> {
  final FlightsRepository repository;

FlightsUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(FlightsParams params) async {
    final result = await repository.flights(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class FlightsParams {
  FlightsParams();

  FlightsParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
