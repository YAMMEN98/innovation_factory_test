import 'package:dartz/dartz.dart';
import 'package:innovation_factory_test/src/core/network/error/failures.dart';
import 'package:innovation_factory_test/src/core/util/usecases/usecase.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/filtering_flights_response_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/repositories/flights_repository.dart';

class FilteringFlightsUseCase
    extends UseCase<FilteringFlightsResponseModel, FlightsParams> {
  final FlightsRepository repository;

  FilteringFlightsUseCase(this.repository);

  @override
  Future<Either<Failure, FilteringFlightsResponseModel>> call(
      FlightsParams params) async {
    final result = await repository.flights(params);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        return Right(r);
      },
    );
  }
}

class FlightsParams {
  FlightsParams({
    required this.type,
    required this.classString,
    required this.adults,
    required this.childes,
    required this.infants,
    required this.tours,
  });

  late final String type;
  late final String classString;
  late final int adults;
  late final int childes;
  late final int infants;
  late final List<ToursParams> tours;

  FlightsParams.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    classString = json['class'];
    adults = json['adults'];
    childes = json['childs'];
    infants = json['infants'];
    tours =
        List.from(json['tours']).map((e) => ToursParams.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['class'] = classString;
    _data['adults'] = adults;
    _data['childs'] = childes;
    _data['infants'] = infants;
    _data['tours'] = tours.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ToursParams {
  ToursParams({
    required this.departureDate,
    required this.returnDate,
    required this.airportOriginCode,
    required this.airportDestinationCode,
  });

  late final String departureDate;
  late final String returnDate;
  late final String airportOriginCode;
  late final String airportDestinationCode;

  ToursParams.fromJson(Map<String, dynamic> json) {
    departureDate = json['departureDate'];
    returnDate = json['returnDate'];
    airportOriginCode = json['airportOriginCode'];
    airportDestinationCode = json['airportDestinationCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['departureDate'] = departureDate;
    _data['returnDate'] = returnDate;
    _data['airportOriginCode'] = airportOriginCode;
    _data['airportDestinationCode'] = airportDestinationCode;
    return _data;
  }
}
