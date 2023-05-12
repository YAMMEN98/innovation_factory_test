import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';


class LoginUseCase extends UseCase<String, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    final result = await repository.login(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class LoginParams {
  LoginParams({
    required this.mobileNumber,
  });

  late final String mobileNumber;


  LoginParams.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mobileNumber'] = mobileNumber;
    return data..removeWhere((key, value) => value == null);
  }
}
