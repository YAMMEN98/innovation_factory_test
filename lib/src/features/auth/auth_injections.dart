import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/remote/auth_api.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

import 'data/data_sources/locale/auth_shared_prefs.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';

initAuthInjections() {
  sl.registerSingleton<AuthApi>( AuthApi(sl()));
  sl.registerSingleton<AuthSharedPrefs>(AuthSharedPrefs(sl()));
  sl.registerSingleton<AuthRepository>( AuthRepositoryImpl(sl(), sl()));
  sl.registerSingleton<LoginUseCase>( LoginUseCase(sl()));
  sl.registerSingleton<VerificationCodeUseCase>(
       VerificationCodeUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>( LogoutUseCase(sl()));
}
