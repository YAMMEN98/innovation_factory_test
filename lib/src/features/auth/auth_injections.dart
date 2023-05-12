import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/auth_api.dart';
import 'data/data_sources/auth_shared_prefs.dart';
import 'data/repositories/auth_repo_empl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';

initAuthInjections() {
  sl.registerFactory<AuthApi>(() => AuthApi());
  sl.registerFactory<AuthSharedPrefs>(() => AuthSharedPrefs(sl()));
  sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
}
