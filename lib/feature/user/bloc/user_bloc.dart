import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:onr_test/app/routes/router_config.dart';
import 'package:onr_test/feature/user/widget/total_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserState()) {
    on<UserEvent>((event, emit) {});

    on<GetUserEvent>((event, emit) async {
      final result = await _userRepository.getUser();
      result.fold((l) {}, (r) {
        emit(state.copyWith(listUser: r));
      });
    });
    on<TotalUserEvent>((event, emit) async {
      showDialog(
          context: rootNavigatorKey.currentContext!,
          builder: (context) {
            return TotalUser();
          });
    });
  }
  final UserRepository _userRepository;
}
