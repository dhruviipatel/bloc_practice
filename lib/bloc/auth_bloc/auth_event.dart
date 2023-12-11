part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequestEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequestEvent({required this.email, required this.password});
}

final class AuthLogoutRequestEvent extends AuthEvent {}
