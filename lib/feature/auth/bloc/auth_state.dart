part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.token = ''});

  final String token;

  AuthState copyWith({
    String? token,
  }) {
    return AuthState(
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [token];
}
