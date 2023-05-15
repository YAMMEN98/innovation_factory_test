
// Actual Error Flights Data
Map<String, dynamic> actualErrorFlightsDataApi = {
  "status": false,
  "message": "Unknown Error",
  "data": null,
};

// Actual Empty Flights Data
Map<String, dynamic> actualEmptyFlightsDataApi = {
  "status": true,
  "message": "flight data is successful",
  "data": {
    "session_id": "MTY4NDEwNzk0Nl8zNzc4Nzc=",
    "flights": [],
    "pagination_details": {
      "currentPage": 1,
      "totalPages": 20,
      "countInPage": 10,
      "total": 200,
      "hasPreviousPage": false,
      "hasNextPage": true,
      "first": 0
    },
    "filterCategories": {
      "fare_type": [
        "WebFare",
        "Public"
      ],
      "price": [
        487.99,
        1195.48
      ],
      "stops_departure": [
        0,
        1
      ],
      "stops_return": [
        0,
        1
      ],
      "duration_departure": [
        275,
        655
      ],
      "duration_return": [
        260,
        610
      ],
      "airline_departure": [
        "Pegasus Airlines",
        "Royal Jordanian Airline",
        "Saudi Arabian Airlines",
        "Azerbaijan Airlines",
        "Flydubai",
        "Gulf Air",
        "Turkish Airlines",
        "Indigo Airlines"
      ],
      "airline_return": [
        "Pegasus Airlines",
        "Royal Jordanian Airline",
        "Saudi Arabian Airlines",
        "Azerbaijan Airlines",
        "Flydubai",
        "Gulf Air",
        "Turkish Airlines",
        "Indigo Airlines"
      ]
    }
  },
};

// Actual Success Flights Data
Map<String, dynamic> actualSuccessFlightsDataApi = {
  "status": true,
  "message": "flight data is successful",
  "data": {
    "session_id": "MTY4NDEwNzk0Nl8zNzc4Nzc=",
    "flights": [
      {
        "ticketType": "eTicket",
        "IsPassportMandatory": null,
        "sourceCode": "NTR4UkRta213RU5NUHp2cUQzVXMwTUpxeTBzbVc0eTZvQ3oyUzJFT1FaSlowU1ArNWhvUitlL28xVDQyakdveU9xOERIQW8vZFIrblNYSlYwaXFpQnJzd2Y2SDNYTkZvczI5OVVOSkY3Q0NKYThybHB5dk80dzNlSisyQmI1ZmFIbXdxc3pqcUlwQTRwSzhNMHRoZmRnPT0=",
        "FareType": "WebFare",
        "IsRefundable": "No",
        "type": "Return",
        "passengers": [
          {
            "Baggage": [
              "SB",
              "SB"
            ],
            "CabinBaggage": [
              "SB",
              "SB"
            ],
            "Type": "Adult",
            "Quantity": 1,
            "price_Base": "126.66 USD",
            "price_Service": "0.00 USD",
            "price_Surcharges": "0.00 USD",
            "price_Taxes": "94 USD",
            "price_Total": "220.65 USD",
            "RefundAllowed": false,
            "RefundPenaltyAmount": "0.00 USD",
            "ChangeAllowed": false,
            "ChangePenaltyAmount": "0.00 USD"
          },
          {
            "Baggage": [
              "SB",
              "SB"
            ],
            "CabinBaggage": [
              "SB",
              "SB"
            ],
            "Type": "Child",
            "Quantity": 1,
            "price_Base": "126.66 USD",
            "price_Service": "0.00 USD",
            "price_Surcharges": "0.00 USD",
            "price_Taxes": "94 USD",
            "price_Total": "220.65 USD",
            "RefundAllowed": false,
            "RefundPenaltyAmount": "0.00 USD",
            "ChangeAllowed": false,
            "ChangePenaltyAmount": "0.00 USD"
          },
          {
            "Baggage": [
              "SB",
              "SB"
            ],
            "CabinBaggage": [
              "SB",
              "SB"
            ],
            "Type": "Infant",
            "Quantity": 1,
            "price_Base": "45.86 USD",
            "price_Service": "0.00 USD",
            "price_Surcharges": "0.00 USD",
            "price_Taxes": "0.83 USD",
            "price_Total": "46.68 USD",
            "RefundAllowed": false,
            "RefundPenaltyAmount": "0.00 USD",
            "ChangeAllowed": false,
            "ChangePenaltyAmount": "0.00 USD"
          }
        ],
        "tours": [
          {
            "TotalStops": 0,
            "tourSegments": [
              {
                "SeatsRemaining": 4,
                "FlightNumber": "749",
                "AirlineCode": "PC",
                "AirlineName": "Pegasus Airlines",
                "DepartureAirportCode": "SHJ",
                "DepartureDateTime": "2023-05-15T07:15:00",
                "ArrivalAirportCode": "SAW",
                "ArrivalDateTime": "2023-05-15T10:50:00",
                "CabinClassCode": "Y",
                "JourneyDuration": "275",
                "CabinClassText": "BASIC"
              }
            ]
          },
          {
            "TotalStops": 0,
            "tourSegments": [
              {
                "SeatsRemaining": 4,
                "FlightNumber": "746",
                "AirlineCode": "PC",
                "AirlineName": "Pegasus Airlines",
                "DepartureAirportCode": "SAW",
                "DepartureDateTime": "2023-05-22T22:35:00",
                "ArrivalAirportCode": "SHJ",
                "ArrivalDateTime": "2023-05-23T03:55:00",
                "CabinClassCode": "Y",
                "JourneyDuration": "260",
                "CabinClassText": "BASIC"
              }
            ]
          }
        ],
        "fareTotal": {
          "Basic": "299.17 USD",
          "ServiceTax": "0.00 USD",
          "TotalTax": "188.83 USD",
          "Total": "487.99 USD"
        }
      },
    ]
  },
};
