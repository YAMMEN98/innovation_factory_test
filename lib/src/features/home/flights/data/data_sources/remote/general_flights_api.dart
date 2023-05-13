import 'package:dio/dio.dart';

abstract class GeneralFlightsApi {
  final Dio dio;

  GeneralFlightsApi(this.dio);
}
