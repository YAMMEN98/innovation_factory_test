import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
   int selectedCarTripType = 0;
   bool isDifferentReturn = true;

  FilterCubit() : super(FilterInitial());

   // Change Car Rental Type
   void changeCarRentalType(int carRentalType){
     selectedCarTripType = carRentalType;
     emit(ChangeCarRentalTypeState());
   }

   // Change Is Different Return
   void changeIsDifferentReturn(bool value){
     isDifferentReturn = value;
     emit(ChangeIsDifferentReturnState());
   }
}
