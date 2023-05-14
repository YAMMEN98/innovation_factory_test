import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/home/general/domain/usecases/home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeUseCase homeUseCase;

  HomeBloc() : super(HomeInitial()) {
    homeUseCase = sl<HomeUseCase>();

    on<OnRequestingHomeEvent>(_onLoggingIn);
  }

  /// Home event
  _onLoggingIn(OnRequestingHomeEvent event, Emitter<HomeState> emitter) async {
    emitter(LoadingDataState());

    final result = await homeUseCase.call(HomeParams());
    result.fold((l) {
      emitter(ErrorDataState(l.errorMessage));
    }, (r) {
      emitter(SuccessDataState());
    });
  }
}
