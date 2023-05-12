import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
