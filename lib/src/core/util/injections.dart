import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:innovation_factory_test/main.dart';
import 'package:innovation_factory_test/src/core/network/logger_interceptor.dart';
import 'package:innovation_factory_test/src/core/util/constant/network_constant.dart';
import 'package:innovation_factory_test/src/core/util/log/app_logger.dart';
import 'package:innovation_factory_test/src/features/auth/auth_injections.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/car_rental_injections.dart';
import 'package:innovation_factory_test/src/features/home/flights/flights_injections.dart';
import 'package:innovation_factory_test/src/features/home/general/home_injections.dart';
import 'package:innovation_factory_test/src/features/home/hotels/hotels_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_feature/app_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  // sl.registerLazySingleton<LogController>(() => LogController());
  await initCoreInjections();
  await initSharedPrefsInjections();
  await initAppInjections();
  await initAuthInjections();
  await initHomeInjections();
  await initFlightsInjections();
  await initHotelsInjections();
  await initCarRentalInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> onUnexpectedError(ErrorInterceptorHandler handler, error) async {
  handler.reject(error);
  navigatorKey.currentState?.pushReplacementNamed("/login");
}

Future<void> initCoreInjections() async {
  initRootLogger();

  sl.registerSingletonAsync<Dio>(() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8"
        },
        responseType: ResponseType.json,
        connectTimeout: Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    ));

    return dio;
  });

  // DioNetwork.initDio();
}
