import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'data/data_sources/app_shared_prefs.dart';
import 'domain/usecase/get_data_usecase.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
  sl.registerFactory<GetDataUseCase>(() => GetDataUseCase(sl()));
}