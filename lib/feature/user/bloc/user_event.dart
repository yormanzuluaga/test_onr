part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  const GetUserEvent();

  @override
  List<Object> get props => [];
}

class TotalUserEvent extends UserEvent {
  const TotalUserEvent();

  @override
  List<Object> get props => [];
}
