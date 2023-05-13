import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

abstract class GeneralHotelsApi {
  final Dio dio;

  GeneralHotelsApi(this.dio);

  Future<ApiResponse<String>> hotels(HotelsParams params);
}
