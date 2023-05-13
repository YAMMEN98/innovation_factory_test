import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/auth/domain/entities/auth_response_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseModel>> login(LoginParams params);
  Future<Either<Failure, UserModel>> verificationCode(VerificationCodeParams params);
  Future<Either<Failure, AuthResponseModel>> register(RegisterParams params);
}
