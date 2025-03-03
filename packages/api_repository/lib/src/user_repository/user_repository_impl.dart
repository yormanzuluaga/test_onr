import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  UserResource userResource;
  @override
  UserRepositoryImpl({
    required this.userResource,
  });

  @override
  Future<Either<ApiException, List<UserModel>>> getUser({
    Map<String, String>? headers,
  }) async {
    final productModel = await userResource.getUser(
      headers: headers,
    );
    return productModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
