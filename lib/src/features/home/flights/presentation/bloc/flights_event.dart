part of 'flights_bloc.dart';

abstract class FlightsEvent {
  const FlightsEvent();
}

// Change Selected Flight Type
class OnChangingSelectedFlightTypeEvent extends FlightsEvent {
  final int selectedFlightTypeIndex;

  OnChangingSelectedFlightTypeEvent(this.selectedFlightTypeIndex);
}
