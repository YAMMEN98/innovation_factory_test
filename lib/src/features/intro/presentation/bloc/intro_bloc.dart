import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/user_model.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/locale/auth_shared_prefs.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<OnCheckUserEvent>(_onCheckingUser);
  }

  // Check User Event
  _onCheckingUser(OnCheckUserEvent event, Emitter<IntroState> emitter) async {
    UserModel? result = sl<AuthSharedPrefs>().getUser();
    if (result == null) {
      emitter(SuccessCheckUserStatusState(false));
    } else {
      emitter(SuccessCheckUserStatusState(true));
    }
  }
}
