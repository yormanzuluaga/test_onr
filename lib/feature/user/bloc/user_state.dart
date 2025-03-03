part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.listUser = const [],
  });

  final List<UserModel> listUser;

  UserState copyWith({
    List<UserModel>? listUser,
  }) {
    return UserState(
      listUser: listUser ?? this.listUser,
    );
  }

  @override
  List<Object> get props => [listUser];
}
