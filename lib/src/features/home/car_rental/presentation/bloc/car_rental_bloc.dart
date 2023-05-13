import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/domain/usecases/car_rental_usecase.dart';

part 'car_rental_event.dart';
part 'car_rental_state.dart';

class CarRentalBloc extends Bloc<CarRentalEvent, CarRentalState> {
  late CarRentalUseCase homeUseCase;

  CarRentalBloc() : super(CarRentalInitial()) {
    homeUseCase = sl<CarRentalUseCase>();

  }




}
