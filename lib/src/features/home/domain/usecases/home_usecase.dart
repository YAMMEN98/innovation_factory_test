import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/home/domain/repositories/home_repository.dart';

class HomeUseCase extends UseCase<String, HomeParams> {
  final HomeRepository repository;

HomeUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(HomeParams params) async {
    final result = await repository.home(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class HomeParams {
  HomeParams();

  HomeParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
