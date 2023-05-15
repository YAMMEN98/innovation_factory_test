import 'package:flutter_test/flutter_test.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/repositories/flights_repo_impl.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'flights_repository_impl_test.mocks.dart';
import 'mock_data/actual_flights_data.dart';
import 'mock_data/excpected_flights_data.dart';

@GenerateMocks([FlightsApi])
void main() {
  FlightsParams params = FlightsParams(
    adults: 1,
    childes: 1,
    infants: 1,
    type: "Return",
    classString: "Economy",
    tours: [
      ToursParams(
        departureDate: "2023-05-15",
        returnDate: "2023-05-22",
        airportOriginCode: "DXB",
        airportDestinationCode: "IST",
      ),
    ],
  );

  late MockFlightsApi mockFlightsApi;
  late FlightsRepository flightsRepository;
  setUp(() {
    mockFlightsApi = MockFlightsApi();
    flightsRepository = FlightsRepositoryImpl(mockFlightsApi);
  });

  group(
    "Test flights_repository_impl",
    () {
      test(
        "Failure In ApiResponse Return Null Values",
        () async {
          when(mockFlightsApi.filteringFlights(params)).thenAnswer(
            (realInvocation) async {
              return actualErrorFlightsDataRepo;
            },
          );
          var result;
          try {
            result = await flightsRepository.flights(params);
          } catch (e) {
            result = e;
          }
          expect(result.value, ServerFailure(unknownError, 400));
        },
      );

      test(
        "Get All Flights Success Case With Empty List",
        () async {
          when(mockFlightsApi.filteringFlights(params)).thenAnswer(
            (realInvocation) async {
              return actualEmptyFlightsDataRepo;
            },
          );
          var result;
          try {
            result = await flightsRepository.flights(params);
          } catch (e) {
            result = e;
          }
          expect(result.value, expectedEmptyFlightsDataRepo.value);
        },
      );

      test(
        "Get All Flights Success Case With Fill List",
        () async {
          when(mockFlightsApi.filteringFlights(params))
              .thenAnswer((realInvocation) async {
            return actualSuccessFlightsDataRepo;
          });
          var result;
          try {
            result = await flightsRepository.flights(params);
          } catch (e) {
            result = e;
          }
          expect(result.value, expectedSuccessFlightsDataRepo.value);
        },
      );
    },
  );
}
