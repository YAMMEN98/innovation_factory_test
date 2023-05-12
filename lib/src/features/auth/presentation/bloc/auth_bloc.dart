import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late LoginUseCase loginUseCase;

  AuthBloc() : super(AuthInitial()) {
    loginUseCase = sl<LoginUseCase>();

    on<OnLoggingInEvent>(_onLoggingIn);
  }

  /// Login event
  _onLoggingIn(OnLoggingInEvent event, Emitter<AuthState> emitter) async {
    emitter(LoadingLoginState());

    final result = await loginUseCase.call(
      LoginParams(
        mobileNumber: event.emailOrPhoneNumber,
      ),
    );
    result.fold((l) {
      emitter(ErrorLoginState(l.errorMessage));
    }, (r) {
      emitter(SuccessLoginState());
    });
  }
}
