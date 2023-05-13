import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_profile_model.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/domain/entities/auth_response_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

import '../data_sources/locale/auth_shared_prefs.dart';
import '../data_sources/remote/auth_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;
  final AuthSharedPrefs authPrefs;

  AuthRepositoryImpl(this.authApi, this.authPrefs);

  /// Login Method Repository
  @override
  Future<Either<Failure, AuthResponseModel>> login(LoginParams params) async {
    try {
      final result = await authApi.login(params);
      return Right(result.data!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  /// Verification Code Method Repository
  @override
  Future<Either<Failure, UserModel>> verificationCode(
      VerificationCodeParams params) async {
    try {
      final result = await authApi.verificationCode(params);
      return Right(result.data!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  /// Register Method Repository
  @override
  Future<Either<Failure, AuthResponseModel>> register(
      RegisterParams params) async {
    try {
      final result = await authApi.register(params);

      return Right(result.data!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
