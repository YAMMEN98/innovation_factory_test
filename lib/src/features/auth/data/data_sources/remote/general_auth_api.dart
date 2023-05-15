import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/entities/auth_response_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

abstract class GeneralAuthApi {
  final Dio dio;

  GeneralAuthApi(this.dio);

  // Login Api
  Future<ApiResponse<AuthResponseModel>> login(LoginParams params);

  // Verification Code Api
  Future<ApiResponse<UserModel>> verificationCode(
      VerificationCodeParams params);

  // Register Api
  Future<ApiResponse<AuthResponseModel>> register(RegisterParams params);

  // Logout Api
  Future<ApiResponse<bool>> logout(LogoutParams params);
}
