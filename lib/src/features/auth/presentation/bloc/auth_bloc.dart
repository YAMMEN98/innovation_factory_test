import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late LoginUseCase loginUseCase;
  late VerificationCodeUseCase verificationCodeUseCase;

  AuthBloc() : super(AuthInitial()) {
    loginUseCase = sl<LoginUseCase>();
    verificationCodeUseCase = sl<VerificationCodeUseCase>();

    on<OnLoggingInEvent>(_onLoggingInEvent);
    on<OnVerificationEvent>(_onVerificationCodeEvent);
  }

  /// Login Event
  _onLoggingInEvent(OnLoggingInEvent event, Emitter<AuthState> emitter) async {
    emitter(LoadingLoginState());

    final result = await loginUseCase.call(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) {
      emitter(ErrorLoginState(l.errorMessage));
    }, (r) {
      emitter(SuccessLoginState(
        userId: r.userId,
        registeredId: r.registeredEmail,
      ));
    });
  }


  /// Verification Code Event
  _onVerificationCodeEvent(OnVerificationEvent event, Emitter<AuthState> emitter) async {
    emitter(LoadingVerificationCodeState());

    final result = await verificationCodeUseCase.call(
      VerificationCodeParams(
        userId: event.userId,
        otp: event.otp,
        app: event.app,
        deviceType: event.deviceType,
      ),
    );
    result.fold((l) {
      emitter(ErrorVerificationCodeState(l.errorMessage));
    }, (r) {
      emitter(SuccessVerificationCodeState());
    });
  }
}
