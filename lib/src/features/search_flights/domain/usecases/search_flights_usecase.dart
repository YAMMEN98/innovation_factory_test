import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/repositories/search_flights_repository.dart';

class SearchFlightsUseCase extends UseCase<String, SearchFlightsParams> {
  final SearchFlightsRepository repository;

  SearchFlightsUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(SearchFlightsParams params) async {
    final result = await repository.searchFlights(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class SearchFlightsParams {
  SearchFlightsParams();

  SearchFlightsParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
