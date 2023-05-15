import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/booking_flight/data/data_sources/locale/flight_booking_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/booking_flight/data/data_sources/remote/flight_booking_api.dart';
import 'package:innovation_factory_test/src/features/booking_flight/data/repositories/flight_booking_repo_impl.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/repositories/flight_booking_repository.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/usecases/flight_booking_usecase.dart';

initFlightBookingInjections() {
  sl.registerFactory<FlightBookingApi>(() => FlightBookingApi(sl()));
  sl.registerFactory<FlightBookingSharedPrefs>(
      () => FlightBookingSharedPrefs(sl()));
  sl.registerFactory<FlightBookingRepository>(
      () => FlightBookingRepositoryImpl(sl(), sl()));
  sl.registerFactory<FlightBookingUseCase>(() => FlightBookingUseCase(sl()));
}
