part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

/// --------------------Start Login-------------------- ///

/// Loading login state
class LoadingLoginState extends AuthState {}

/// Error login state
class ErrorLoginState extends AuthState {
  final String errorMsg;

  ErrorLoginState(this.errorMsg);
}

/// Success login state
class SuccessLoginState extends AuthState {}

/// --------------------End Login-------------------- ///
