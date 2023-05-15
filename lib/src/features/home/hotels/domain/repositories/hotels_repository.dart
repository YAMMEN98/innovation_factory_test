import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

abstract class HotelsRepository {
  Future<Either<Failure, String>> hotels(HotelsParams params);
}
