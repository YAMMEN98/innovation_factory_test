import 'package:dio/dio.dart';
import 'package:innovation_factory_test/main.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';

String handleDioError(DioError error) {
  String errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectionTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.connectionTimeout:
      errorDescription = "Internet Connection Problem.";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.badResponse:
      {
        if(error.response?.data is! Map){
          errorDescription = S.of(navigatorKey.currentContext!).server_error;
          return errorDescription;
        }

        /// From golex server response
        if (error.response?.data['status'] != null &&
            (error.response?.data['status'] ?? "0") != "0") {
          errorDescription = error.response?.data['message'];
        } else {
          /// From our server response
          if (error.response?.statusCode == 200 &&
              (error.response?.data['status'])) {
            if ((error.response?.data["message"] ?? "") != "") {
              errorDescription = (error.response?.data["message"] ?? "");
            } else {
              errorDescription = unknownError;
            }
          } else if (error.response?.statusCode == 422) {
            errorDescription = error.response?.data["message"] ??unknownError;
          } else if (error.response?.statusCode == 413) {
            errorDescription = error.response!.statusMessage ?? "";
          } else if (error.response?.statusCode == 400) {
            errorDescription =
                error.response?.data["message"] ?? unknownError;
          } else if (error.response?.statusCode == 401) {
            errorDescription =
                error.response?.data["message"] ?? unknownError;
          } else if (error.response?.statusCode == 403) {
            errorDescription = error.response?.data is String
                ? "403 Forbidden"
                : error.response?.data["message"] ?? unknownError;
          } else if (error.response?.statusCode == 404) {
            errorDescription = error.response?.data is String
                ? "404 $unknownError"
                : error.response?.data["message"] ?? unknownError;
          } else if (error.response?.statusCode == 409) {
            errorDescription = error.response?.data["message"] +
                    ",\n Minutes left to join: " +
                    error.response?.data["data"]["mins_to_join"].toString() ??
                unknownError;
          } else if (error.response?.statusCode == 429) {
            errorDescription = error.response?.data["message"];
          } else {
            errorDescription =
                "Received invalid status code: ${error.response?.statusCode}";
          }
        }

        break;
      }

    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
    case DioErrorType.badCertificate:
      // TODO: Handle this case.
      break;
    case DioErrorType.connectionError:
      // TODO: Handle this case.
      break;
    case DioErrorType.unknown:
      // TODO: Handle this case.
      break;
  }

  return errorDescription;
}
