// ignore_for_file: cast_nullable_to_non_nullable

part of 'router_config.dart';

Widget _loginHandler(BuildContext context, GoRouterState state) {
  return const AuthPage();
}

Widget _homeHandler(BuildContext context, GoRouterState state, Widget child) {
  return HomePage(
    child: child,
  );
}

Page<Widget> _userPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  return NoTransitionPage(child: UserPage());
}

Page<Widget> _detailPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  return NoTransitionPage(child: Detail());
}

// Page<Widget> _videoPageHandler(
//   BuildContext context,
//   GoRouterState state,
// ) {
//   return NoTransitionPage(child: VideoPage());
// }
