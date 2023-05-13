import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/data_sources/locale/hotels_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/data_sources/remote/hotels_api.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/repositories/hotels_repository.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

class HotelsRepositoryImpl extends HotelsRepository {
  final HotelsApi hotelsApi;
  final HotelsSharedPrefs hotelsPrefs;

  HotelsRepositoryImpl(this.hotelsApi, this.hotelsPrefs);

  /// Hotels method
  @override
  Future<Either<Failure, String>> hotels(HotelsParams params) async {
    try {
      final result = await hotelsApi.hotels(params);
      return Right("");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
