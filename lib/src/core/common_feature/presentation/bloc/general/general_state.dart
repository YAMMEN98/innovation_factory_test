part of 'general_bloc.dart';

@immutable
abstract class GeneralState {}

class GeneralInitial extends GeneralState {}

// ---------- Start Logout ----------

// Loading Logout State
class LoadingLogoutState extends GeneralState {}

// Success Logout State
class SuccessLogoutState extends GeneralState {}

// Error Logout State
class ErrorLogoutState extends GeneralState {
  final String errorMessage;

  ErrorLogoutState(this.errorMessage);
}

// ---------- End Logout ----------
