import 'package:innovation_factory_test/src/features/home/flights/domain/entities/flight_model.dart';

class FilteringFlightsPageParams {
  final List<FlightModel> flights;
  final String flyingFrom;
  final String flyingTo;
  final String departureDate;
  final String returnDate;
  final String adults;
  final String children;
  final String infants;

  FilteringFlightsPageParams({
    required this.flights,
    required this.flyingFrom,
    required this.flyingTo,
    required this.departureDate,
    required this.returnDate,
    required this.adults,
    required this.children,
    required this.infants,
  });
}
