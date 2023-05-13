import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/hotels/domain/usecases/hotels_usecase.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  late HotelsUseCase homeUseCase;

  HotelsBloc() : super(HotelsInitial()) {
    homeUseCase = sl<HotelsUseCase>();
  }
}
