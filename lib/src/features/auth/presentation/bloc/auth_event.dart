part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

// On Login In Event
class OnLoggingInEvent extends AuthEvent {
  final String email;
  final String password;

  OnLoggingInEvent(this.email, this.password);
}

// On Verification Account
class OnVerificationEvent extends AuthEvent {
  final int userId;
  final int otp;
  final String app;
  final String deviceType;

  OnVerificationEvent({
    required this.userId,
    required this.otp,
    required this.app,
    required this.deviceType,
  });
}
