import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/general/data/data_sources/locale/home_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/general/data/data_sources/remote/home_api.dart';
import 'package:innovation_factory_test/src/features/home/general/domain/repositories/home_repository.dart';
import 'package:innovation_factory_test/src/features/home/general/domain/usecases/home_usecase.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApi homeApi;
  final HomeSharedPrefs homePrefs;

  HomeRepositoryImpl(this.homeApi, this.homePrefs);

  /// Home method
  @override
  Future<Either<Failure, String>> home(HomeParams params) async {
    try {
      final result = await homeApi.home(params);
      return result.fold((l) {
        return Left(ServerFailure(l.errorMessage, null));
      }, (r) {
        return Right(r);
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
