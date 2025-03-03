import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/app/routes/router_config.dart';
import 'package:onr_test/app/routes/routes_names.dart';
import 'package:onr_test/core/database/token_store.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthEvent>((event, emit) {});

    on<LoginEvent>((event, emit) async {
      await TokenStore.instance.savedToken(
        token: event.token,
      );
      emit(state.copyWith(token: event.token));
      rootNavigatorKey.currentContext?.go(RoutesNames.home);
    });

    on<CloseEvent>((event, emit) async {
      await TokenStore.instance.removerToken();
      emit(state.copyWith(token: ''));
      rootNavigatorKey.currentContext?.go(RoutesNames.login);
    });
  }
}
