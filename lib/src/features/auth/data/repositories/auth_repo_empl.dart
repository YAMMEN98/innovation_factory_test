import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';



import '../data_sources/auth_api.dart';
import '../data_sources/auth_shared_prefs.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;
  final AuthSharedPrefs authPrefs;

  AuthRepositoryImpl(this.authApi, this.authPrefs);

  /// Login method
  @override
  Future<Either<Failure, String>> login(LoginParams params) async {
    try {
      final result = await authApi.login(params);
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
