import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';

part 'intro_event.dart';

part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  late LoginUseCase loginUseCase;

  IntroBloc() : super(IntroInitial()) {
    loginUseCase = sl<LoginUseCase>();

    on<OnGettingDataEvent>(_onLoggingIn);
  }

  /// Login event
  _onLoggingIn(OnGettingDataEvent event, Emitter<IntroState> emitter) async {
    emitter(LoadingGetDataState());

    final result = await loginUseCase.call(
      LoginParams(
        mobileNumber: "",
      ),
    );
    result.fold((l) {
      emitter(ErrorGetDataState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetDataState());
    });
  }
}
