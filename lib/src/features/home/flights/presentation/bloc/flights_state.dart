part of 'flights_bloc.dart';

abstract class FlightsState {
  const FlightsState();
}

class FlightsInitial extends FlightsState {}

// Chang Selected flight Type
class ChangeSelectedFlightState extends FlightsState {
  final int selectedFlightTypeIndex;

  ChangeSelectedFlightState(this.selectedFlightTypeIndex);
}
