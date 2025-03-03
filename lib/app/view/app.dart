import 'package:flutter/services.dart';
import 'package:onr_test/core/database/token_store.dart';
import 'package:onr_test/feature/auth/bloc/auth_bloc.dart';
import 'package:onr_test/feature/main_dashboard/bloc/product_bloc.dart';
import 'package:onr_test/feature/user/bloc/user_bloc.dart';
import 'package:onr_ui/onr_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_test/app/routes/routes.dart';
import 'package:onr_test/injection/injection_container.dart' as injection;
import 'package:onr_test/l10n/l10n.dart';
import 'package:onr_test/app/routes/router_config.dart';

/// {@template app}
/// The `App` class is a Dart class that represents the main application
/// and sets up the theme, localization, and routing.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = CustomRouterConfig().router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.sl<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.sl<AuthBloc>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return FutureBuilder(
              future: _loadUserData(context),
              builder: (context, snapshot) {
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                  ),
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: const AppTheme().themeData,
                    title: 'OnrTest',
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routeInformationProvider: router.routeInformationProvider,
                    routeInformationParser: router.routeInformationParser,
                    routerDelegate: router.routerDelegate,
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                  ),
                );
              });
        },
      ),
    );
  }

  Future<void> _loadUserData(BuildContext context) async {
    final authBloc = context.read<AuthBloc>();

    if (authBloc.state.token.isNotEmpty) {
      final token = TokenStore.instance.token;

      if (token.isNotEmpty) {
        authBloc.add(
          LoginEvent(
            token: token,
          ),
        );
      }
    }
  }
}
