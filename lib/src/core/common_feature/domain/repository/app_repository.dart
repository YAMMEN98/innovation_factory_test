import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';

abstract class AppRepository {
  Future<Either<Failure, String>> getData();
}
