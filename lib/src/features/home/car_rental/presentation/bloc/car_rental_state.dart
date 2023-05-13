part of 'car_rental_bloc.dart';

abstract class CarRentalState {
  const CarRentalState();
}

class CarRentalInitial extends CarRentalState {}

// Chang Selected Car Rental Type
class ChangeSelectedCarRentalState extends CarRentalState {
  final int selectedCarRentalTypeIndex;

  ChangeSelectedCarRentalState(this.selectedCarRentalTypeIndex);
}



