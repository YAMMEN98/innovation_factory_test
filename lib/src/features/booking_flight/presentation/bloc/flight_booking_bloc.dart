import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/booking_flight/domain/usecases/flight_booking_usecase.dart';

part 'flight_booking_event.dart';

part 'flight_booking_state.dart';

class FlightBookingBloc extends Bloc<FlightBookingEvent, FlightBookingState> {
  late FlightBookingUseCase flightBookingUseCase;

  FlightBookingBloc() : super(FlightBookingInitial()) {
    flightBookingUseCase = sl<FlightBookingUseCase>();
  }
}
