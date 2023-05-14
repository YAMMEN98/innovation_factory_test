import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';

part 'flights_event.dart';

part 'flights_state.dart';

class FlightsBloc extends Bloc<FlightsEvent, FlightsState> {
  late FilteringFlightsUseCase _filteringFlightsUseCase;

  FlightsBloc() : super(FlightsInitial()) {
    _filteringFlightsUseCase = sl<FilteringFlightsUseCase>();

    on<OnChangingSelectedFlightTypeEvent>(_onChangingSelectedFlightType);
    on<OnFilteringFlightsEvent>(_onFilteringFlightsEvent);
  }

  // Filtering Flights Event
  _onChangingSelectedFlightType(OnChangingSelectedFlightTypeEvent event,
      Emitter<FlightsState> emitter) async {
    emitter(ChangeSelectedFlightState(event.selectedFlightTypeIndex));
  }

  // Filtering Flights Event
  _onFilteringFlightsEvent(
      OnFilteringFlightsEvent event, Emitter<FlightsState> emitter) async {
    emitter(LoadingFilteringFlightsState());

    final result = await _filteringFlightsUseCase.call(FlightsParams(
      type: event.type,
      classString: event.classString,
      adults: event.adults,
      childes: event.childes,
      infants: event.infants,
      tours: [
        ToursParams(
          departureDate: event.departureDate,
          returnDate: event.returnDate,
          airportOriginCode: event.airportOriginCode,
          airportDestinationCode: event.airportDestinationCode,
        ),
      ],
    ));

    result.fold((l) {
      emitter(FailureFilteringFlightsState(l.errorMessage));
    }, (r) {
      emitter(SuccessFilteringFlightsState(r));
    });
  }
}
