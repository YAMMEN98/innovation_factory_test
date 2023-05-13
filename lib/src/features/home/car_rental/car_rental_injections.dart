import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/data_sources/locale/car_rental_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/data_sources/remote/car_rental_api.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/data/repositories/car_rental_repo_impl.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/repositories/car_rental_repository.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/usecases/car_rental_usecase.dart';

initCarRentalInjections() {
  sl.registerFactory<CarRentalApi>(() => CarRentalApi(sl()));
  sl.registerFactory<CarRentalSharedPrefs>(() => CarRentalSharedPrefs(sl()));
  sl.registerFactory<CarRentalRepository>(
      () => CarRentalRepositoryImpl(sl(), sl()));
  sl.registerFactory<CarRentalUseCase>(() => CarRentalUseCase(sl()));
}
