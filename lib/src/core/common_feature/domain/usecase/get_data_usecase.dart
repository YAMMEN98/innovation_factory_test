import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';

import '../repository/app_repository.dart';

class GetDataUseCase extends UseCase<String, GetPublicInfoParams> {
  final AppRepository repository;

  GetDataUseCase(this.repository);

  /// Get Data
  @override
  Future<Either<Failure, String>> call(GetPublicInfoParams params) async {
    final result = await repository.getData();
    return result.fold((l) async {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

/// Get Data Params
class GetPublicInfoParams {}
