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

// ----------Start Filtering Flights---------- //

// Loading Filtering Flights State
class LoadingFilteringFlightsState extends FlightsState{}


// Loading Filtering Flights State
class SuccessFilteringFlightsState extends FlightsState{
  final FilteringFlightsResponseModel FlightsModel;
  final FilteringFlightsPageParams pageParams;

  SuccessFilteringFlightsState(this.FlightsModel, this.pageParams);
}

// Loading Filtering Flights State
class FailureFilteringFlightsState extends FlightsState{
  final String errorMessage;

  FailureFilteringFlightsState(this.errorMessage);
}
// ----------End Filtering Flights---------- //