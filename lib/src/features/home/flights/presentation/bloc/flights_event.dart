part of 'flights_bloc.dart';

abstract class FlightsEvent {
  const FlightsEvent();
}

// Change Selected Flight Type
class OnChangingSelectedFlightTypeEvent extends FlightsEvent {
  final int selectedFlightTypeIndex;

  OnChangingSelectedFlightTypeEvent(this.selectedFlightTypeIndex);
}

// On Filtering Flights Event
class OnFilteringFlightsEvent extends FlightsEvent {
  final String type;
  final String classString;
  final int adults;
  final int children;
  final int infants;
  final String departureDate;
  final String returnDate;
  final String airportOriginCode;
  final String airportDestinationCode;

  OnFilteringFlightsEvent({
    required this.type,
    required this.classString,
    required this.adults,
    required this.children,
    required this.infants,
    required this.departureDate,
    required this.returnDate,
    required this.airportOriginCode,
    required this.airportDestinationCode,
  });
}
