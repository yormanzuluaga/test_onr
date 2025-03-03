import 'dart:convert';
import 'dart:io';
import 'package:api_helper/api_helper.dart';
import 'package:either_dart/either.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class ProductResource {
  /// {@macro example_resource}
  ProductResource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  // ignore: unused_field
  final ApiClient _apiClient;

  /// Get /game/prompt/terms
  ///
  /// Returns a [List<String>].
  Future<Either<ApiException, List<ProductModel>>> getProduct({
    Map<String, String>? headers,
  }) async {
    final response = await _apiClient.get(
      'products',
      modifiedHeaders: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final productResponse = (jsonDecode(response.body) as List).map((e) => ProductModel.fromJson(e)).toList();
      return Right(productResponse);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          response.body,
        ),
      );
    }
  }

  Future<Either<ApiException, ProductModel>> getProductDetail({
    Map<String, String>? headers,
    required String id,
  }) async {
    final response = await _apiClient.get(
      'products/$id',
      modifiedHeaders: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final productResponse = ProductModel.fromJson(jsonDecode(response.body));
      return Right(productResponse);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          response.body,
        ),
      );
    }
  }
}
