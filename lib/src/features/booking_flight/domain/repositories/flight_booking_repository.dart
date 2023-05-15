import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/usecases/flight_booking_usecase.dart';

abstract class FlightBookingRepository {
  Future<Either<Failure, String>> flightBooking(FlightBookingParams params);
}
