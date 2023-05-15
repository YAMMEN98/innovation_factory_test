import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:innovation_factory_test/main.dart';
import 'package:innovation_factory_test/src/core/network/dio_injection.dart';
import 'package:innovation_factory_test/src/core/util/log/app_logger.dart';
import 'package:innovation_factory_test/src/core/util/log/log_controller.dart';
import 'package:innovation_factory_test/src/core/util/log/log_controller_injection.dart';
import 'package:innovation_factory_test/src/features/auth/auth_injections.dart';
import 'package:innovation_factory_test/src/features/booking_flight/flight_booking_injections.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/car_rental_injections.dart';
import 'package:innovation_factory_test/src/features/home/flights/flights_injections.dart';
import 'package:innovation_factory_test/src/features/home/general/home_injections.dart';
import 'package:innovation_factory_test/src/features/home/hotels/hotels_injections.dart';
import 'package:innovation_factory_test/src/features/search_flights/search_flights_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_feature/app_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  initLogControllerInjection();
  await initCoreInjections();
  await initSharedPrefsInjections();
  await initAppInjections();
  await initAuthInjections();
  await initHomeInjections();
  await initFlightsInjections();
  await initHotelsInjections();
  await initCarRentalInjections();
  await initSearchFlightsInjections();
  await initFlightBookingInjections();
}

// Shared Preference
initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

// Dio
Future<void> initCoreInjections() async {
  initRootLogger();
  initDioInjection();
}


