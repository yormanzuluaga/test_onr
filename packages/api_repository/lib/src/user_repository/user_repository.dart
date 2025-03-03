import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<ApiException, List<UserModel>>> getUser({
    Map<String, String>? headers,
  });
}
