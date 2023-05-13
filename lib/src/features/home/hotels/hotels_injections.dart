import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/data_sources/locale/hotels_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/data_sources/remote/hotels_api.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/repositories/hotels_repo_impl.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/repositories/hotels_repository.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

initHotelsInjections() {
  sl.registerFactory<HotelsApi>(() => HotelsApi(sl()));
  sl.registerFactory<HotelsSharedPrefs>(() => HotelsSharedPrefs(sl()));
  sl.registerFactory<HotelsRepository>(() => HotelsRepositoryImpl(sl(), sl()));
  sl.registerFactory<HotelsUseCase>(() => HotelsUseCase(sl()));
}
