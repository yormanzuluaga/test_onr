import 'package:onr_test/core/database/token_store.dart';
import 'package:onr_test/feature/auth/view/auth_page.dart';
import 'package:onr_test/feature/user/view/user_page.dart';
import 'package:onr_ui/onr_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/app/routes/routes_names.dart';
import 'package:onr_test/feature/home/view/home_page.dart';
import 'package:onr_test/feature/main_dashboard/view/main_dashboard_page.dart';
import 'package:onr_test/feature/main_dashboard/widgets/detail.dart';

part 'router_handlers.dart';

/// Navigator keys
/// The `healthNavigatorKey` is a global key that is used to access the
/// management navigator.
final healthNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>();

/// The `managementNavigatorKey` is a global key that is used to access the
/// management navigator.
final managementNavigatorKey = GlobalKey<NavigatorState>();

/// The rootScaffoldMessengerKey is a global key that is used to access the
/// rootScaffold navigator.
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class CustomRouterConfig {
  // final appBloc = context.read<AppBloc>();

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutesNames.home,
    redirect: (context, state) {
      if (TokenStore.instance.token.isEmpty) {
        return RoutesNames.login;
      }
      return null;

      //return null;
    },
    errorPageBuilder: (context, state) {
      return NoTransitionPage(
        child: UnderConstruction(title: state.matchedLocation),
      );
    },
    routes: [
      GoRoute(
        path: RoutesNames.login,
        builder: _loginHandler,
        redirect: (context, state) {
          if (TokenStore.instance.token.isNotEmpty) {
            return RoutesNames.home;
          }
          return null;
        },
      ),

      /// Main ShellRoute for authenticated users
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: _homeHandler,
        routes: [
          /// Home route
          GoRoute(
            path: RoutesNames.home,
            parentNavigatorKey: homeNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MainDashboardPage(),
              );
            },
          ),
          ShellRoute(
            parentNavigatorKey: homeNavigatorKey,
            navigatorKey: healthNavigatorKey,
            pageBuilder: (context, state, child) {
              return NoTransitionPage(child: child);
            },
            routes: [
              // Web version
              GoRoute(
                path: RoutesNames.user,
                parentNavigatorKey: healthNavigatorKey,
                pageBuilder: _userPageHandler,
              ),
            ],
          ),
          ShellRoute(
            parentNavigatorKey: homeNavigatorKey,
            navigatorKey: managementNavigatorKey,
            pageBuilder: (context, state, child) {
              return NoTransitionPage(child: child);
            },
            routes: [
              // Mobile version
              GoRoute(
                path: RoutesNames.user,
                parentNavigatorKey: managementNavigatorKey,
                pageBuilder: _userPageHandler,
              ),
            ],
          ),

          /// Nested routes (shared structure for both health and management)
        ],
      ),
      GoRoute(
        path: RoutesNames.detail,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: _detailPageHandler,
      ),
      // GoRoute(
      //   path: RoutesNames.video,
      //   parentNavigatorKey: rootNavigatorKey,
      //   pageBuilder: _videoPageHandler,
      // ),
    ],
  );

  /// Expose the router instance
  GoRouter get router => _router;
}

/// Pop until a specific path
void popUntilPath(String routePath, BuildContext context) {
  final router = GoRouter.of(context);
  while ('${router.routeInformationProvider.value.uri}' != routePath) {
    if (!router.canPop()) return;
    router.pop();
  }
}
