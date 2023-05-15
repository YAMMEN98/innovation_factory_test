import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/booking_flight/data/data_sources/locale/flight_booking_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/booking_flight/data/data_sources/remote/flight_booking_api.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/repositories/flight_booking_repository.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/usecases/flight_booking_usecase.dart';

class FlightBookingRepositoryImpl extends FlightBookingRepository {
  final FlightBookingApi flightBookingApi;
  final FlightBookingSharedPrefs flightBookingPrefs;

  FlightBookingRepositoryImpl(this.flightBookingApi, this.flightBookingPrefs);

  // Flight Booking Method
  @override
  Future<Either<Failure, String>> flightBooking(
      FlightBookingParams params) async {
    try {
      final result = await flightBookingApi.flightBooking(params);
      return Right("");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
