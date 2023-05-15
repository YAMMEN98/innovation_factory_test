import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/network/interceptors/logger_interceptor.dart';
import 'package:innovation_factory_test/src/core/network/interceptors/queue_interceptor.dart';
import 'package:innovation_factory_test/src/core/util/constant/network_constant.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/core/util/log/app_logger.dart';

initDioInjection() async {
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

    dio.interceptors.add(AppInterceptor());

    return dio;
  });
}
