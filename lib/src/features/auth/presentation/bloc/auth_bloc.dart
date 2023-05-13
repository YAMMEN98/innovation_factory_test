import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/locale/auth_shared_prefs.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/verification_code_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late LoginUseCase loginUseCase;
  late VerificationCodeUseCase verificationCodeUseCase;
  late RegisterUseCase registerUseCase;

  AuthBloc() : super(AuthInitial()) {
    loginUseCase = sl<LoginUseCase>();
    verificationCodeUseCase = sl<VerificationCodeUseCase>();
    registerUseCase = sl<RegisterUseCase>();

    on<OnLoggingInEvent>(_onLoggingInEvent);
    on<OnVerificationEvent>(_onVerificationCodeEvent);
    on<OnRegisteringEvent>(_onRegisterEvent);
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
  _onVerificationCodeEvent(
      OnVerificationEvent event, Emitter<AuthState> emitter) async {
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
      if (event.isRememberMe) {
        // Save User Information On Local Storage
        sl<AuthSharedPrefs>().saveUser(r);
      }

      emitter(SuccessVerificationCodeState());
    });
  }

  /// Register Event
  _onRegisterEvent(OnRegisteringEvent event, Emitter<AuthState> emitter) async {
    emitter(LoadingRegisterState());

    final result = await registerUseCase.call(
      RegisterParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        password: event.password,
        referUser: event.referUser,
      ),
    );
    result.fold((l) {
      emitter(ErrorRegisterState(l.errorMessage));
    }, (r) {
      emitter(SuccessRegisterState(
        userId: r.userId,
        registeredId: r.registeredEmail,
      ));
    });
  }
}
