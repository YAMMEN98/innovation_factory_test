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
  final bool isRememberMe;

  OnVerificationEvent({
    required this.userId,
    required this.otp,
    required this.app,
    required this.deviceType,
    required this.isRememberMe,
  });
}

// On Register Event
class OnRegisteringEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String referUser;

  OnRegisteringEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.referUser,
  });
}
