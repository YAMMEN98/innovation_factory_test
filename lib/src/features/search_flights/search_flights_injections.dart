import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/data_sources/locale/search_flights_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/data_sources/remote/search_flights_api.dart';
import 'package:innovation_factory_test/src/features/search_flights/data/repositories/search_flights_repo_impl.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/repositories/search_flights_repository.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

initSearchFlightsInjections() {
  sl.registerFactory<SearchFlightsApi>(() => SearchFlightsApi(sl()));
  sl.registerFactory<SearchFlightsSharedPrefs>(() => SearchFlightsSharedPrefs(sl()));
  sl.registerFactory<SearchFlightsRepository>(() => SearchFlightsRepositoryImpl(sl(), sl()));
  sl.registerFactory<SearchFlightsUseCase>(() => SearchFlightsUseCase(sl()));
}
