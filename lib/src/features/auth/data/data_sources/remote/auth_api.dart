import 'package:dio/dio.dart';
import 'package:innovation_factory_test/main.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/remote/general_auth_api.dart';
import 'package:innovation_factory_test/src/features/auth/domain/entities/auth_response_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

class AuthApi extends GeneralAuthApi {
  AuthApi(super.dio);

  // Login Api Method
  Future<ApiResponse<AuthResponseModel>> login(LoginParams params) async {
    try {
      final result = (await dio.post(
        "login",
        data: params.toJson(),
      ));
      ApiResponse<AuthResponseModel> response =
          ApiResponse.fromJson(result.data, AuthResponseModel.fromJson);
      if (response.status == null || response.status == false) {
        throw ServerException(
            response.message ?? S.of(navigatorKey.currentContext!).server_error,
            result.statusCode);
      }
      return response;
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  // Verification Code Api Method
  Future<ApiResponse<UserModel>> verificationCode(
      VerificationCodeParams params) async {
    try {
      final result = (await dio.post(
        "loginOtp",
        data: params.toJson(),
      ));
      ApiResponse<UserModel> response =
          ApiResponse.fromJson(result.data, UserModel.fromJson);
      if (response.status == null || response.status == false) {
        throw ServerException(
            response.message ?? S.of(navigatorKey.currentContext!).server_error,
            result.statusCode);
      }

      return response;
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
