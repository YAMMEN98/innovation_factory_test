import 'package:dio/dio.dart';

abstract class GeneralCarRentalApi {
  final Dio dio;

  GeneralCarRentalApi(this.dio);
}
