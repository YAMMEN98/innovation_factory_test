import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/entities/auth_response_model.dart';
import 'package:innovation_factory_test/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<AuthResponseModel, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponseModel>> call(RegisterParams params) async {
    final result = await repository.register(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class RegisterParams {
  RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.referUser,
  });

  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String password;
  late final String referUser;

  RegisterParams.fromJson(Map<String, dynamic> json) {
    email = json['firstName'];
    email = json['lastName'];
    email = json['email'];
    email = json['password'];
    email = json['phone'];
    password = json['refer_user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['refer_user'] = referUser;
    return data..removeWhere((key, value) => value == null);
  }
}
