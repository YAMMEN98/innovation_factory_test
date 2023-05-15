part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

/// --------------------Start Login-------------------- ///

/// Loading Login State
class LoadingLoginState extends AuthState {}

/// Error Login State
class ErrorLoginState extends AuthState {
  final String errorMsg;

  ErrorLoginState(this.errorMsg);
}

/// Success Login State
class SuccessLoginState extends AuthState {
  final int userId;
  final String registeredId;

  SuccessLoginState({required this.userId, required this.registeredId});
}

/// --------------------End Login-------------------- ///

/// --------------------Start Verification Account-------------------- ///

/// Loading Verification Code State
class LoadingVerificationCodeState extends AuthState {}

/// Error Verification Code State
class ErrorVerificationCodeState extends AuthState {
  final String errorMsg;

  ErrorVerificationCodeState(this.errorMsg);
}

/// Success Verification Code State
class SuccessVerificationCodeState extends AuthState {}

/// --------------------End Verification Account-------------------- ///

/// --------------------Start Register-------------------- ///

/// Loading Register State
class LoadingRegisterState extends AuthState {}

/// Error Register State
class ErrorRegisterState extends AuthState {
  final String errorMsg;

  ErrorRegisterState(this.errorMsg);
}

/// Success Register State
class SuccessRegisterState extends AuthState {
  final int userId;
  final String registeredId;

  SuccessRegisterState({required this.userId, required this.registeredId});
}

/// --------------------End Register-------------------- ///
