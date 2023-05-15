import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/repositories/flight_booking_repository.dart';

class FlightBookingUseCase extends UseCase<String, FlightBookingParams> {
  final FlightBookingRepository repository;

  FlightBookingUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(FlightBookingParams params) async {
    final result = await repository.flightBooking(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class FlightBookingParams {
  FlightBookingParams();

  FlightBookingParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
