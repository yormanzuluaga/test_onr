part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.listProduct = const [],
    this.product,
  });

  final List<ProductModel> listProduct;
  final ProductModel? product;

  ProductState copyWith({
    List<ProductModel>? listProduct,
    ProductModel? product,
  }) {
    return ProductState(
      listProduct: listProduct ?? this.listProduct,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
        listProduct,
        product,
      ];
}
