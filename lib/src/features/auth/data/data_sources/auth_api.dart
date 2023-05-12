import 'package:innovation_factory_test/src/core/network/dio_network.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../main.dart';

class AuthApi {

  /// Login method
  Future<Either<Failure, String>> login(LoginParams params) async {
    try {
      final result = (await DioNetwork.appAPI.get("posts")).data;
      return Right("");

      /// Handle Success/Failure Response To Return Right Or Left
      // if (result['code'] == "0" || result['code'] == 0) {
      //   return Right("");
      // } else {
      //   return Left(ServerFailure(result['msg'] ?? S.of(navigatorKey.currentContext!).server_error, null));
      // }
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

}
