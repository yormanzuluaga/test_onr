import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<ApiException, List<ProductModel>>> getProduct({
    Map<String, String>? headers,
  });

  Future<Either<ApiException, ProductModel>> getProductDetail({
    Map<String, String>? headers,
    required String id,
  });
}
