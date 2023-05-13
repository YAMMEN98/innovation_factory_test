import 'package:dio/dio.dart';

abstract class GeneralHomeApi {
  final Dio dio;

  GeneralHomeApi(this.dio);
}
