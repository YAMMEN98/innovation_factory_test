import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innovation_factory_test/src/core/network/error/exceptions.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/features/home/flights/data/data_sources/remote/flights_api.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/usecases/filtering_flights_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'flights_api_test.mocks.dart';
import 'mock_data/actual_flights_data.dart';
import 'mock_data/excpected_flights_data.dart';

@GenerateMocks([Dio, HttpClientAdapter])
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
  late MockDio mockDio;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late FlightsApi flightsApi;
  setUp(() {
    mockDio = MockDio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    mockDio.httpClientAdapter = mockHttpClientAdapter;
    flightsApi = FlightsApi(mockDio);
  });

  RequestOptions requestOptions = RequestOptions();

  group(
    "Test flights_api",
    () {
      test(
        "Get All Flights Failed Case",
        () async {
          when(
            mockDio.post(
              "flights",
              data: params.toJson(),
            ),
          ).thenAnswer((realInvocation) async {
            return Response(
              requestOptions: requestOptions,
              data: actualErrorFlightsDataApi,
            );
          });
          var result;
          try {
            result = await flightsApi.filteringFlights(params);
          } catch (e) {
            result = e;
          }
          expect(result, ServerException(unknownError, null));
        },
      );

      test(
        "Get All Flights Empty Case",
        () async {
          when(
            mockDio.post(
              "flights",
              data: params.toJson(),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                requestOptions: requestOptions,
                statusCode: 200,
                data: actualEmptyFlightsDataApi,
              );
            },
          );
          var result;
          try {
            result = await flightsApi.filteringFlights(params);
          } catch (e) {
            result = e;
          }

          expect(result.data.flights.isEmpty,
              expectedEmptyFlightsDataApi.data!.flights.isEmpty);
        },
      );

      test(
        "Get All Flights Success Case",
        () async {
          when(
            mockDio.post(
              "flights",
              data: params.toJson(),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                requestOptions: requestOptions,
                statusCode: 200,
                data: actualSuccessFlightsDataApi,
              );
            },
          );
          var result;
          try {
            result = await flightsApi.filteringFlights(params);
          } catch (e) {
            result = e;
          }

          expect(result, expectedSuccessFlightsDataApi);
        },
      );
    },
  );
}
