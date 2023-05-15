import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/fare_total_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/flight_model.dart';

// Expected Empty Flights Data
Right<Failure, FilteringFlightsResponseModel> expectedEmptyFlightsDataRepo = Right(
  FilteringFlightsResponseModel(
    sessionId: "MTY4NDEwNzk0Nl8zNzc4Nzc=",
    flights: [],
  ),
);


// Expected Success Flights Data
Right<Failure, FilteringFlightsResponseModel> expectedSuccessFlightsDataRepo = Right(
  FilteringFlightsResponseModel(
    sessionId: "MTY4NDEwNzk0Nl8zNzc4Nzc=",
    flights: [
      FlightModel(
        ticketType: "",
        sourceCode:
            "NTR4UkRta213RU5NUHp2cUQzVXMwTUpxeTBzbVc0eTZvQ3oyUzJFT1FaSlowU1ArNWhvUitlL28xVDQyakdveU9xOERIQW8vZFIrblNYSlYwaXFpQnJzd2Y2SDNYTkZvczI5OVVOSkY3Q0NKYThybHB5dk80dzNlSisyQmI1ZmFIbXdxc3pqcUlwQTRwSzhNMHRoZmRnPT0=",
        FareType: "",
        IsRefundable: "",
        type: "",
        passengers: [],
        tours: [],
        fareTotal: FareTotalModel(
          basic: "",
          serviceTax: "",
          total: "",
          totalTax: "",
        ),
      ),
    ],
  ),
);
