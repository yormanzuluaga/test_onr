part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.token,
  });

  final String token;

  @override
  List<Object> get props => [token];
}

class CloseEvent extends AuthEvent {
  const CloseEvent();

  @override
  List<Object> get props => [];
}
