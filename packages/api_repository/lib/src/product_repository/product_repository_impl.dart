import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductResource productResource;
  @override
  ProductRepositoryImpl({
    required this.productResource,
  });

  @override
  Future<Either<ApiException, List<ProductModel>>> getProduct({
    Map<String, String>? headers,
  }) async {
    final productModel = await productResource.getProduct(
      headers: headers,
    );
    return productModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<ApiException, ProductModel>> getProductDetail({
    Map<String, String>? headers,
    required String id,
  }) async {
    final productModel = await productResource.getProductDetail(
      headers: headers,
      id: id,
    );
    return productModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
