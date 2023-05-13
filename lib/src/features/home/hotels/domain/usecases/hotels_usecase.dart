import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/repositories/hotels_repository.dart';

class HotelsUseCase extends UseCase<String, HotelsParams> {
  final HotelsRepository repository;

  HotelsUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(HotelsParams params) async {
    final result = await repository.hotels(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class HotelsParams {
  HotelsParams();

  HotelsParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
