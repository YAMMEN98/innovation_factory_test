import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/repositories/auth_repository.dart';

class VerificationCodeUseCase
    extends UseCase<UserModel, VerificationCodeParams> {
  final AuthRepository repository;

  VerificationCodeUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(VerificationCodeParams params) async {
    final result = await repository.verificationCode(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class VerificationCodeParams {
  VerificationCodeParams({
    required this.userId,
    required this.otp,
    required this.app,
    required this.deviceType,
  });

  late final int userId;
  late final int otp;
  late final String app;
  late final String deviceType;

  VerificationCodeParams.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
    app = json['app'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['otp'] = otp;
    data['app'] = app;
    data['device_type'] = deviceType;
    return data..removeWhere((key, value) => value == null);
  }
}
