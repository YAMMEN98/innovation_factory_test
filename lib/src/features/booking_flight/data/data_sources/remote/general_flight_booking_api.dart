import 'package:dio/dio.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/usecases/flight_booking_usecase.dart';

abstract class GeneralFlightBookingApi {
  final Dio dio;

  GeneralFlightBookingApi(this.dio);

  Future<ApiResponse<String>> flightBooking(FlightBookingParams params);
}
