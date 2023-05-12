import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/remote/auth_api.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';
import 'data/data_sources/locale/auth_shared_prefs.dart';
import 'data/repositories/auth_repo_empl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';

initAuthInjections() {
  sl.registerFactory<AuthApi>(() => AuthApi(sl()));
  sl.registerFactory<AuthSharedPrefs>(() => AuthSharedPrefs(sl()));
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
  sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerFactory<VerificationCodeUseCase>(() => VerificationCodeUseCase(sl()));
}
