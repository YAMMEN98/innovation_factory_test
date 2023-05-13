part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

/// --------------------Start Get Data-------------------- ///

// Success Check User Status
class SuccessCheckUserStatusState extends IntroState {
  final bool isLoggedIn;

  SuccessCheckUserStatusState(this.isLoggedIn);
}

/// --------------------End GetData-------------------- ///
