import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/locale/auth_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:meta/meta.dart';

part 'general_event.dart';

part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  late LogoutUseCase logoutUseCase;

  GeneralBloc() : super(GeneralInitial()) {
    logoutUseCase = sl<LogoutUseCase>();

    on<OnLogoutEvent>(_onLogoutEvent);
  }

  /// Logout Event
  _onLogoutEvent(OnLogoutEvent event, Emitter<GeneralState> emitter) async {
    emitter(LoadingLogoutState());

    final result = await logoutUseCase.call(
      LogoutParams(),
    );
    result.fold((l) {
      emitter(ErrorLogoutState(l.errorMessage));
    }, (r) {

      emitter(SuccessLogoutState());
    });
  }
}
