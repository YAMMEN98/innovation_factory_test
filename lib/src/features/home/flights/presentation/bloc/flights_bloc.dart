import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/flights_usecase.dart';

part 'flights_event.dart';
part 'flights_state.dart';

class FlightsBloc extends Bloc<FlightsEvent, FlightsState> {
  late FlightsUseCase homeUseCase;

  FlightsBloc() : super(FlightsInitial()) {
    homeUseCase = sl<FlightsUseCase>();

    on<OnChangingSelectedFlightTypeEvent>(_onChangingSelectedFlightType);
  }

  /// Flights event
  _onChangingSelectedFlightType(OnChangingSelectedFlightTypeEvent event,
      Emitter<FlightsState> emitter) async {
    emitter(ChangeSelectedFlightState(event.selectedFlightTypeIndex));
  }
}
