import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/domain/usecases/home_usecase.dart';

abstract class HomeRepository {
  Future<Either<Failure, String>> home(HomeParams params);
}
