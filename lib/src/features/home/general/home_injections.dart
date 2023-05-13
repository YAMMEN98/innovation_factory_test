import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/general/data/data_sources/locale/home_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/general/data/data_sources/remote/home_api.dart';
import 'package:innovation_factory_test/src/features/home/general/data/repositories/home_repo_impl.dart';
import 'package:innovation_factory_test/src/features/home/general/domain/repositories/home_repository.dart';
import 'package:innovation_factory_test/src/features/home/general/domain/usecases/home_usecase.dart';

initHomeInjections() {
  sl.registerFactory<HomeApi>(() => HomeApi(sl()));
  sl.registerFactory<HomeSharedPrefs>(() => HomeSharedPrefs(sl()));
  sl.registerFactory<HomeUseCase>(() => HomeUseCase(sl()));
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(sl(), sl()));
}
