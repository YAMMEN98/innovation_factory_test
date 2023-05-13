import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/data/data_sources/remote/home_api.dart';

import 'data/data_sources/home_shared_prefs.dart';
import 'data/repositories/home_repo_empl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/home_usecase.dart';

initHomeInjections() {
  sl.registerFactory<HomeApi>(() => HomeApi(sl()));
  sl.registerFactory<HomeSharedPrefs>(() => HomeSharedPrefs(sl()));
  sl.registerFactory<HomeUseCase>(() => HomeUseCase(sl()));
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(sl(), sl()));
}
