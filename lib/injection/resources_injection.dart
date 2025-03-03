part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerFactory<ProductResource>(() => ProductResource(
        apiClient: sl(),
      ));
  sl.registerFactory<UserResource>(() => UserResource(
        apiClient: sl(),
      ));
}
