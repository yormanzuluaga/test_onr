part of 'injection_container.dart';

void _initBlocsInjections() {
  sl.registerFactory(
    () => AuthBloc(),
  );
  sl.registerFactory(
    () => ProductBloc(productRepository: sl()),
  );
  sl.registerFactory(
    () => UserBloc(userRepository: sl()),
  );
}
