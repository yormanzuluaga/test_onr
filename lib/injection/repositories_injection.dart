part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerFactory<ProductRepository>(() => ProductRepositoryImpl(productResource: sl()));

  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(userResource: sl()));
}
