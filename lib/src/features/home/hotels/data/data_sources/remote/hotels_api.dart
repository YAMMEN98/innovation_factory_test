import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/core/network/error/dio_error_handler.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/features/home/hotels/data/data_sources/remote/general_hotels_api.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

class HotelsApi extends GeneralHotelsApi {
  HotelsApi(super.dio);

  /// Hotels method
  @override
  Future<ApiResponse<String>> hotels(HotelsParams params) async {
    try {
      final result = (await dio.get("")).data;
      return ApiResponse();
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
