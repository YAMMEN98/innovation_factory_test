import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/locale/flights_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/repositories/flights_repo_impl.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

initFlightsInjections() {
  sl.registerFactory<FlightsApi>(() => FlightsApi(sl()));
  sl.registerFactory<FlightsSharedPrefs>(() => FlightsSharedPrefs(sl()));
  sl.registerFactory<FlightsRepository>(
      () => FlightsRepositoryImpl(sl(), sl()));
  sl.registerFactory<FlightsUseCase>(() => FlightsUseCase(sl()));
}
