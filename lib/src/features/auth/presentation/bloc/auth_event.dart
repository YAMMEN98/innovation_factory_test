part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

/// Login event
class OnLoggingInEvent extends AuthEvent {
  // Data from verification capture
  final Map jsonData;
  final String emailOrPhoneNumber;
  final String password;

  OnLoggingInEvent(this.jsonData, this.emailOrPhoneNumber, this.password);
}

