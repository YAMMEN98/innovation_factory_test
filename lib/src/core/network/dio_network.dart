// import 'dart:async';
// import 'dart:convert';
//
// import 'package:innovation_factory_test/src/core/common_feature/domain/entities/log_tags.dart';
// import 'package:innovation_factory_test/src/core/network/logger_interceptor.dart';
// import 'package:innovation_factory_test/src/core/util/log/app_logger.dart';
// import 'package:innovation_factory_test/src/core/util/constant/network_constant.dart';
// import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
// import 'package:innovation_factory_test/src/core/util/injections.dart';
// import 'package:innovation_factory_test/src/core/util/log/log_controller.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_logs/flutter_logs.dart';
//
// class DioNetwork {
//   static late Dio appAPI;
//   static late Dio retryAPI;
//
//   static List<Completer> appListQueued = [];
//
//   static void initDio() {
//     appAPI = Dio(baseOptions(apiUrl));
//     appAPI.interceptors.add(loggerInterceptor());
//     appAPI.interceptors.add(appQueuedInterceptorsWrapper());
//
//
//     retryAPI = Dio(baseOptions(apiUrl));
//     retryAPI.interceptors.add(loggerInterceptor());
//     retryAPI.interceptors.add(interceptorsWrapper());
//   }
//
//   static LoggerInterceptor loggerInterceptor() {
//     return LoggerInterceptor(
//       logger,
//       request: true,
//       requestBody: true,
//       error: true,
//       responseBody: true,
//       responseHeader: false,
//       requestHeader: true,
//     );
//   }
//
//   ///__________App__________///
//
//   /// App Api Queued Interceptor
//   static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
//     return QueuedInterceptorsWrapper(
//       onRequest: (RequestOptions options, r) async {
//         Map<String, dynamic> headers = Helper.getHeaders();
//
//         if (kDebugMode) {
//           print("Headers");
//           print(json.encode(headers));
//         }
//         options.headers = headers;
//         appAPI.options.headers = headers;
//
//
//         sl<LogController>().log(LogTags.request, json.encode(options.data), LogLevel.INFO);
//
//         appListQueued.add(Completer());
//         if (appListQueued.length == 1) {
//           return r.next(options);
//         } else {
//           if (appListQueued.isNotEmpty) {
//             bool result = await appListQueued[appListQueued.length - 2].future;
//             // if (appListQueued.isNotEmpty) {
//             //   appListQueued.removeRange(0, appListQueued.length - 1);
//             // }
//             if (result) {
//               Map<String, dynamic> headers = Helper.getHeaders();
//               options.headers = headers;
//               appAPI.options.headers = headers;
//               return r.next(options);
//             } else {
//               return r.reject(DioError(
//                 requestOptions: options,
//               ));
//             }
//           }
//         }
//       },
//       onError: (error, handler) async {
//         clearQueued();
//
//         sl<LogController>().log(LogTags.error, json.encode(error.response?.data), LogLevel.INFO);
//         try {
//           return handler.next(error);
//         } catch (e) {
//           return handler.reject(error);
//           // onUnexpectedError(handler, error);
//         }
//       },
//       onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) async {
//         sl<LogController>().log(LogTags.response, json.encode(response.data), LogLevel.INFO);
//
//         return handler.next(response);
//
//         /// Handle Page To Navigate To Login Page If User Not Logged In Or Has Expiry Token
//         // if ("${(response.data["code"] ?? "0")}" != "0") {
//         //   if (("${(response.data["code"] ?? "0")}" == "10020" || (response.data["code"] ?? 0) == 10020) ||
//         //       ("${(response.data["code"] ?? "0")}" == "10002" || (response.data["code"] ?? 0) == 10002)) {
//         //     await sl<AuthSharedPrefs>().saveIsLogIn(false);
//         //     await sl<AuthSharedPrefs>().deleteUser();
//         //
//         //     LoginByEnum loginBy = Helper.loginBy();
//         //     dynamic x = await navigatorKey.currentState?.pushNamed("/login_page", arguments: [loginBy]);
//         //
//         //     x = x as List?;
//         //
//         //     if (x == null) {
//         //       if (appListQueued.isNotEmpty && !appListQueued.first.isCompleted) {
//         //         appListQueued.first.complete(true);
//         //         appListQueued.removeAt(0);
//         //       }
//         //       Response res = await _retry(response);
//         //       return handler.resolve(res);
//         //     } else {
//         //       if (x.isNotEmpty) {
//         //         if (x[0] != -1) {
//         //           if (appListQueued.isNotEmpty && !appListQueued.first.isCompleted) {
//         //             appListQueued.first.complete(true);
//         //             appListQueued.removeAt(0);
//         //           }
//         //           Response res = await _retry(response);
//         //           return handler.resolve(res);
//         //         } else {
//         //           clearQueued();
//         //           return handler.resolve(response);
//         //         }
//         //       } else {
//         //         if (appListQueued.isNotEmpty && !appListQueued.first.isCompleted) {
//         //           appListQueued.first.complete(true);
//         //           appListQueued.removeAt(0);
//         //         }
//         //         Response res = await _retry(response);
//         //         return handler.resolve(res);
//         //       }
//         //     }
//         //   }
//         //
//         //   clearQueued();
//         //
//         //   return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.badResponse));
//         // } else {
//         //   if (appListQueued.isNotEmpty && !appListQueued.first.isCompleted) {
//         //     appListQueued.first.complete(true);
//         //     appListQueued.removeAt(0);
//         //   }
//         //   return handler.next(response);
//         // }
//       },
//     );
//   }
//
//   /// App interceptor
//   static InterceptorsWrapper interceptorsWrapper() {
//     return InterceptorsWrapper(
//       onRequest: (RequestOptions options, r) async {
//         Map<String, dynamic> headers = Helper.getHeaders();
//
//         options.headers = headers;
//         appAPI.options.headers = headers;
//
//         return r.next(options);
//       },
//       onResponse: (response, handler) async {
//         sl<LogController>().log(LogTags.response, json.encode(response.data), LogLevel.INFO);
//
//         if ("${(response.data["code"] ?? "0")}" != "0") {
//           return handler.resolve(response);
//           // return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.response));
//         } else {
//           return handler.next(response);
//         }
//       },
//       onError: (error, handler) {
//         clearQueued();
//
//         sl<LogController>().log(LogTags.error, json.encode(error.response?.data), LogLevel.ERROR);
//         try {
//           return handler.next(error);
//         } catch (e) {
//           return handler.reject(error);
//           // onUnexpectedError(handler, error);
//         }
//       },
//     );
//   }
//
//   /// Retry app api
//   static Future<Response> _retry(Response response) async {
//     final options = Options(
//       method: response.requestOptions.method,
//       headers: Helper.getHeaders(),
//     );
//     sl<LogController>().log(LogTags.error, json.encode(response.requestOptions.data), LogLevel.ERROR);
//
//     return (await DioNetwork.retryAPI.request(response.requestOptions.path,
//         data: response.requestOptions.data, queryParameters: response.requestOptions.queryParameters, options: options));
//   }
//
//   /// Clear app api
//   static clearQueued() {
//     if (appListQueued.isNotEmpty) {
//       for (var element in appListQueued) {
//         element.complete(false);
//       }
//
//     }
//     appListQueued.clear();
//   }
//
//
//   static BaseOptions baseOptions(String url) {
//     Map<String, dynamic> headers = Helper.getHeaders();
//
//     return BaseOptions(
//         baseUrl: url,
//         validateStatus: (s) {
//           return s! < 300;
//         },
//         headers: headers..removeWhere((key, value) => value == null),
//         responseType: ResponseType.json);
//   }
//
//
// // /// Clear otc api
// // static clearOtcQueued() {
// //   if (appListQueued.isNotEmpty) {
// //     appListQueued.first.complete(false);
// //     appListQueued.removeAt(0);
// //   }
// //   // DioNetwork.otcAPI.interceptors.clear();
// //   appListQueued.clear();
// //   // otcAPI = Dio(baseOptions(OtcApiUrl));
// //   // otcAPI.interceptors.add(loggerInterceptor());
// //   // otcAPI.interceptors.add(otcQueuedInterceptorsWrapper());
// // }
//
// // /// Clear otc api without complete
// // static void clearOtcQueuedWithoutComplete() {
// //   // if (appListQueued.isNotEmpty) {
// //   //   // appListQueued.first.complete(false);
// //   //   appListQueued.removeAt(0);
// //   // }
// //   // DioNetwork.otcAPI.interceptors.clear();
// //   appListQueued.clear();
// //   // otcAPI = Dio(baseOptions(OtcApiUrl));
// //   // otcAPI.interceptors.add(loggerInterceptor());
// //   // otcAPI.interceptors.add(otcQueuedInterceptorsWrapper());
// // }
//
// }
