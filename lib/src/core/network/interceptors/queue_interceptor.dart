import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/log_tags.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/core/util/log/log_controller.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
   onError(DioError error, ErrorInterceptorHandler handler) {
    sl<LogController>()
        .log(LogTags.error, json.encode(error.response?.data), LogLevel.INFO);
    return handler.reject(error);

  }

  @override
   onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = Helper.getHeaders();

    options.headers = headers;
    sl<Dio>().options.headers = headers;

    sl<LogController>()
        .log(LogTags.request, json.encode(options.data), LogLevel.INFO);

    return handler.next(options);
  }

  @override
   onResponse(Response response, ResponseInterceptorHandler handler) {
    sl<LogController>()
        .log(LogTags.response, json.encode(response.data), LogLevel.INFO);

    return handler.next(response);
  }
}
