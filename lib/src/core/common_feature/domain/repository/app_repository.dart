import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AppRepository {
  Future<Either<Failure, String>> getData();
}